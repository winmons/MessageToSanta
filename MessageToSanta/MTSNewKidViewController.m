//
//  MTSNewKidViewController.m
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "MTSNewKidViewController.h"
#import "MTSDataManager.h"
#import <CoreImage/CoreImage.h>

@interface MTSNewKidViewController ()
@property (nonatomic, strong) NSString * selectedColor;
@end

@implementation MTSNewKidViewController

#pragma mark - VC lifecicle

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

#pragma mark - outlets actions

- (IBAction)colorButtonPressed:(id)sender {    
    UIButton * pressedButton = (UIButton*)sender;
    self.selectedColor = [CIColor colorWithCGColor:pressedButton.backgroundColor.CGColor].stringRepresentation;
    switch(pressedButton.tag) {
        case 101:

            break;
        case 102:
            
            break;
        case 103:
            
            break;
        case 104:
          
            break;
        case 105:
            
            break;
        case 106:
            
            break;
        case 107:
            
            break;
        case 108:
            
            break;
        case 109:
            
            break;
              
    }
}

- (IBAction)completeButtonTouch:(id)sender {
    [MTSDataManager addNewKidToDataBaseWithName:self.nameTextField.text age:@([self.agePickerViewController selectedRowInComponent:0]) favouriteColor:self.selectedColor];
}

#pragma mark - pickerView dataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 17;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%d",row];
}

#pragma mark - textField delegate

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
