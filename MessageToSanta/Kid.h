//
//  Kid.h
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Parent.h"

@class Mail, Picture, Record;

@interface Kid : Parent

@property (nonatomic, retain) NSNumber * index;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSSet *mails;
@property (nonatomic, retain) NSSet *pictures;
@property (nonatomic, retain) NSSet *records;
@end

@interface Kid (CoreDataGeneratedAccessors)

- (void)addMailsObject:(Mail *)value;
- (void)removeMailsObject:(Mail *)value;
- (void)addMails:(NSSet *)values;
- (void)removeMails:(NSSet *)values;

- (void)addPicturesObject:(Picture *)value;
- (void)removePicturesObject:(Picture *)value;
- (void)addPictures:(NSSet *)values;
- (void)removePictures:(NSSet *)values;

- (void)addRecordsObject:(Record *)value;
- (void)removeRecordsObject:(Record *)value;
- (void)addRecords:(NSSet *)values;
- (void)removeRecords:(NSSet *)values;

@end
