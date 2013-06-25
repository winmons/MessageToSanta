//
//  MTSDataManager.m
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "MTSDataManager.h"
#import "MTSCoreDataManager.h"

@implementation MTSDataManager

+ (BOOL) kidsAlreadyExists {
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext * context = [[MTSCoreDataManager coreDataManager]correctManagedContext];
    [request setEntity:[NSEntityDescription entityForName:@"Kid" inManagedObjectContext:context]];
    [request setIncludesSubentities:NO];     
    NSError *err;
    NSInteger count = [context countForFetchRequest:request error:&err];
    if(count>=0) return YES;
    else return NO;    
}

+ (NSArray *) allKidsNamesAgesArray {
    
}

+ (void) addNewKidToDataBaseWithName : (NSString *) name age : (NSInteger *) age favouriteColor : (UIColor *) color {
    
}

@end
