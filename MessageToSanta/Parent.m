//
//  Parent.m
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "Parent.h"
#import "MTSCoreDataManager.h"

@implementation Parent

+ (id)insertObject {
    NSManagedObjectContext *context = [[MTSCoreDataManager coreDataManager] correctManagedContext];
    id object = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([self class])
                                              inManagedObjectContext:context];
    return object;
}

@end
