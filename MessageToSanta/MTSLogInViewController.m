//
//  MTSLogInViewController.m
//  MessageToSanta
//
//  Created by Admin on 6/19/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "MTSLogInViewController.h"
#import "MTSDataManager.h"

@interface MTSLogInViewController ()
@property (nonatomic, strong) NSArray * kidsArray;

@end

@implementation MTSLogInViewController

#pragma mark - initialization

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nameTextField.delegate = self;
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - actions

- (void) logIn {
    
}

#pragma mark - outlets actions

- (IBAction)logInButtonTouch:(id)sender {
    [self logIn];
}
- (IBAction)notInTheListButtonTouch:(id)sender {
    
}

#pragma mark - pickerView delegate
- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

}

#pragma mark - pickerView dataSource

#pragma mark - textField delegate

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [self logIn];
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
