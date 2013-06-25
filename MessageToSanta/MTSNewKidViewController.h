//
//  MTSNewKidViewController.h
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSNewKidViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *agePickerViewController;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@end
