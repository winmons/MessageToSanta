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
#import "MTSMenuViewController.h"
#import "Kid.h"
#import <QuartzCore/QuartzCore.h>

@interface MTSNewKidViewController ()
@property (nonatomic, strong) NSString * selectedColor;
@property (nonatomic, strong) Kid * selectedKid;
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
    self.selectedColor = [CIColor colorWithCGColor:[UIColor whiteColor].CGColor].stringRepresentation;
    // Do any additional setup after loading the view from its nib.
}

- (void) initializeButtons {
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton *)obj;
            btn.layer.borderWidth = 1;
            btn.layer.cornerRadius = 5;
        }
    }];

}

#pragma mark - outlets actions

- (IBAction)colorButtonPressed:(id)sender {    
    UIButton * pressedButton = (UIButton*)sender;
    pressedButton.layer.borderWidth = 5;
    pressedButton.layer.cornerRadius = 5;
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton *)obj;
            if (btn.tag != pressedButton.tag) {
                btn.layer.borderWidth = 1;
                btn.layer.cornerRadius = 5;
            }
        }
    }];
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
    if (![self.nameTextField.text length]>0) self.nameTextField.text = @"Kid";
    self.selectedKid = [MTSDataManager addNewKidToDataBaseWithName:self.nameTextField.text age:@([self.agePickerViewController selectedRowInComponent:0]) favouriteColor:self.selectedColor];
    [self presentMenuViewController];
}

- (void) presentMenuViewController {
    MTSMenuViewController * menuViewController = [MTSMenuViewController new];
    menuViewController.selectedKid = self.selectedKid;
    [self presentViewController:menuViewController animated:YES completion:nil];
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
