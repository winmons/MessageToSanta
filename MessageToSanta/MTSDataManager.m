//
//  MTSDataManager.m
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "MTSDataManager.h"
#import "Kid.h"
#import "MTSCoreDataManager.h"

@implementation MTSDataManager

+ (BOOL) kidsAlreadyExists {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext * context = [[MTSCoreDataManager coreDataManager]correctManagedContext];
    [request setEntity:[NSEntityDescription entityForName:@"Kid" inManagedObjectContext:context]];
    [request setIncludesSubentities:NO];     
    NSError *err;
    NSInteger count = [context countForFetchRequest:request error:&err];
    if(count>0) return YES;
    else return NO;    
}

+ (NSArray *) allKidsNamesAgesArray {
    NSMutableArray * returningArray = [NSMutableArray array];    
    [[[self class]kidsArray] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Kid * kid = (Kid *)obj;
        [returningArray addObject:[NSString stringWithFormat:@"%@, %@ years old",kid.name,kid.age]];
    }];
    return returningArray;
}

+ (NSArray *) kidsArray {
    return [[self class]arrayWithEntity:@"Kid" predicate:nil descriptorsArray:nil];
}

+ (NSArray *) arrayWithEntity : (NSString *) entityName predicate : (NSPredicate *) pred descriptorsArray : (NSArray *) sortDescriptors {
    NSManagedObjectContext * context = [[MTSCoreDataManager coreDataManager] correctManagedContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[[MTSCoreDataManager coreDataManager] correctManagedContext]];
    NSFetchRequest * fetch = [[NSFetchRequest alloc] init];
    [fetch setEntity:entity];
    if (pred)
        [fetch setPredicate:pred];
    if (sortDescriptors)
        [fetch setSortDescriptors:sortDescriptors];
    return [context executeFetchRequest:fetch error:nil];
}

+ (void) addNewKidToDataBaseWithName : (NSString *) name age : (NSNumber *) age favouriteColor : (NSString *) color {
    Kid * newKid = [Kid insertObject];
    newKid.name = name;
    newKid.age = age;
    newKid.color = color;
    [[MTSCoreDataManager coreDataManager]saveContext];
}

@end
