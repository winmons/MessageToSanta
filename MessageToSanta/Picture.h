//
//  Picture.h
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Parent.h"

@class Kid;

@interface Picture : Parent

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) Kid *kid;

@end
