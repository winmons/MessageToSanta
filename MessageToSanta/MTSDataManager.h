//
//  MTSDataManager.h
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTSDataManager : NSObject
+ (NSArray *) allKidsNamesAgesArray;
+ (BOOL) kidsAlreadyExists;
+ (NSArray *) kidsArray;
+ (void) addNewKidToDataBaseWithName : (NSString *) name age : (NSNumber *) age favouriteColor : (NSString *) color;
@end
