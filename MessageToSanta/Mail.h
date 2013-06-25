//
//  Mail.h
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Parent.h"

@class Kid;

@interface Mail : Parent

@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSString * theme;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * receiver;
@property (nonatomic, retain) NSNumber * inbox;
@property (nonatomic, retain) Kid *kid;

@end
