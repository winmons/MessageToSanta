//
//  MTSLogInViewController.m
//  MessageToSanta
//
//  Created by Admin on 6/19/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "MTSLogInViewController.h"
#import "MTSDataManager.h"
#import "Kid.h"
#import "MTSMenuViewController.h"
#import "MTSRegisterViewController.h"

@interface MTSLogInViewController ()
@property (nonatomic, strong) NSArray * kidsArray;
@property (nonatomic, strong) Kid * selectedKid;
@property (nonatomic, strong) NSArray * kidsObjectsArray;
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
    self.kidsArray = [MTSDataManager allKidsNamesAgesArray];
    self.kidsObjectsArray = [MTSDataManager kidsArray];
}

#pragma mark - actions

- (void) logIn {
    MTSMenuViewController * menuViewController = [MTSMenuViewController new];
    menuViewController.selectedKid = self.selectedKid;
    [self presentViewController:menuViewController animated:YES completion:nil];
}

#pragma mark - outlets actions

- (IBAction)logInButtonTouch:(id)sender {
    [self logIn];
}

- (IBAction)notInTheListButtonTouch:(id)sender {
    MTSRegisterViewController * registerViewController = [MTSRegisterViewController new];
    [self presentViewController:registerViewController animated:YES completion:nil];
}

#pragma mark - pickerView delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.nameTextField.text = [self.kidsArray objectAtIndex:row];
    self.selectedKid = [self.kidsObjectsArray objectAtIndex:row];
}

#pragma mark - pickerView dataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.kidsArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.kidsArray objectAtIndex:row];
}

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
