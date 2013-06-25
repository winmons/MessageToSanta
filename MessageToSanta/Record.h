//
//  Record.h
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Parent.h"

@class Kid;

@interface Record : Parent

@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * path;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Kid *kid;

@end
