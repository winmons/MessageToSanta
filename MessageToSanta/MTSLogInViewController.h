//
//  MTSLogInViewController.h
//  MessageToSanta
//
//  Created by Admin on 6/19/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSLogInViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *logInButton;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UIButton *notInTheListButton;
@property (strong, nonatomic) IBOutlet UIPickerView *kidsPickerView;

@end
