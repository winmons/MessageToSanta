//
//  MTSCoreDataManager.h
//  MessageToSanta
//
//  Created by Admin on 6/19/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTSCoreDataManager : NSObject

+ (id) coreDataManager;

@property (nonatomic, strong, readonly) NSManagedObjectModel * managedObjectModel;
@property (nonatomic, strong, readonly) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator * persistentStoreCoordinator;
@property (nonatomic, strong, readonly) NSManagedObjectContext * correctManagedContext;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@end
