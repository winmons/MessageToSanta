//
//  MTSDrawingViewController.h
//  MessageToSanta
//
//  Created by Admin on 6/19/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTSDrawingViewController : UIViewController {
    
    CGPoint lastPoint;
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat brush;
    CGFloat opacity;
    BOOL mouseSwiped;    
}

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIImageView *tempDrawImage;
@property (strong, nonatomic) IBOutlet UISlider *brushSlider;

@end
