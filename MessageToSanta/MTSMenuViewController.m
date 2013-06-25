//
//  MTSMenuViewController.m
//  MessageToSanta
//
//  Created by Admin on 6/25/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "MTSMenuViewController.h"
#import "MTSDrawingViewController.h"
#import "MTSRecorderViewController.h"
#import "MTSNewMailViewController.h"
#import "MTSMailBoxViewController.h"
#import "MTSGameViewController.h"

@interface MTSMenuViewController ()

@end

@implementation MTSMenuViewController

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
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - outlets actions

- (IBAction)drawImageButtonTouch:(id)sender {
    [self presentViewController:[MTSDrawingViewController new] animated:YES completion:nil];
}

- (IBAction)playGameButtonTouch:(id)sender {
    [self presentViewController:[MTSGameViewController new] animated:YES completion:nil];
}

- (IBAction)recordButtonTouch:(id)sender {
    [self presentViewController:[MTSRecorderViewController new] animated:YES completion:nil];
}

- (IBAction)mailBoxButtonTouch:(id)sender {
    [self presentViewController:[MTSMailBoxViewController new] animated:YES completion:nil];
}

- (IBAction)newMailButtonTouch:(id)sender {
    [self presentViewController:[MTSNewMailViewController new] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
