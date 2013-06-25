//
//  DYCCoreDataManager.m
//  DiscoverYourCity
//
//  Created by Admin on 5/9/13.
//  Copyright (c) 2013 organization. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "MTSCoreDataManager.h"

@interface MTSCoreDataManager ()

@property (nonatomic, strong, readwrite) NSManagedObjectModel * managedObjectModel;
@property (nonatomic, strong, readwrite) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, strong, readwrite) NSPersistentStoreCoordinator * persistentStoreCoordinator;
@property (nonatomic, strong, readwrite) NSManagedObjectContext * correctManagedContext;

@end

@implementation MTSCoreDataManager

+ (MTSCoreDataManager *) coreDataManager {
    static dispatch_once_t pred;
    static MTSCoreDataManager *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[MTSCoreDataManager alloc] init];
    });
    
    return shared;
}

- (id) init {
    
    if (self) {
        
    }
    return self;
}

#pragma mark - CoreData

- (NSManagedObjectContext *)correctManagedContext {
    NSManagedObjectContext * context;
    if ([[NSThread currentThread] isMainThread]) {
        context = [self managedObjectContext];
    }
    else {
        context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType] ;
        context.parentContext = [self managedObjectContext];
    }
    return context;
}

- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contextDidSaveNotification:) name:NSManagedObjectContextDidSaveNotification object:nil];
    return _managedObjectContext;
}


- (void) contextDidSaveNotification:(NSNotification *)notification {
    NSManagedObjectContext *savedContext = [notification object];
    
    if (_managedObjectContext == savedContext)
    {
        return;
    }
    
    if (_managedObjectContext.persistentStoreCoordinator != savedContext.persistentStoreCoordinator)
    {
        return;
    }
    
    dispatch_sync(dispatch_get_main_queue(), ^{
        [_managedObjectContext mergeChangesFromContextDidSaveNotification:notification];
    });
}

- (NSManagedObjectModel *) managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"mts.sqlite"];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)saveContext {
    NSManagedObjectContext * mainOne = [self managedObjectContext];
    NSManagedObjectContext *temporaryContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    temporaryContext.parentContext = mainOne;
    
    [self.persistentStoreCoordinator lock];
    
    [temporaryContext performBlock:^{
        
        NSError *error;
        if (![temporaryContext save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        if (mainOne != nil) {
            [mainOne performBlock:^{
                NSError *error;
                BOOL success = [mainOne save:&error];
                if ([mainOne hasChanges] && !success)
                {
                    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                    abort();
                }
            }];
        }
        [self.persistentStoreCoordinator unlock];
    }];
}

@end
