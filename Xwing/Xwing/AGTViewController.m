//
//  AGTViewController.m
//  Xwing
//
//  Created by Eduardo on 12/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTViewController.h"

@interface AGTViewController ()

@end

@implementation AGTViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector (userDidTap:)];
    
    [self.view addGestureRecognizer:tap];
    
    
    
    //Para que el Xwing semueva al hacer un swipe
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector (userDidSwipe:)];
    
    [self.view addGestureRecognizer:swipe];
    
}
-(void) userDidSwipe: (UISwipeGestureRecognizer *)swipe{
    if (swipe.state == UIGestureRecognizerStateRecognized){
        static CGFloat angle = 0;
        [UIView animateWithDuration:3
                              delay:0
             usingSpringWithDamping:0.2
              initialSpringVelocity:0.8
                            options:0
                         animations:^{
                             angle = angle + M_PI_2;
                             self.xwingView.transform = CGAffineTransformMakeRotation(angle);
                         }
                         completion:nil];
        
    }
    
}

-(void) userDidTap: (UITapGestureRecognizer *)tap {
    CGPoint newCenter = [tap locationInView:self.spaceView];
    
    
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionBeginFromCurrentState;
    
    [UIView animateWithDuration:1
                          delay:0
                        options:options
                     animations:^{
                         self.xwingView.center = newCenter;
                         
                     }
                     completion:^(BOOL finished) {
                         //
                     }];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:options
                     animations:^{
                         self.xwingView.transform = CGAffineTransformMakeRotation(M_2_PI);
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.5
                                               delay:0
                                            options:options
                                          animations:^{
                                              self.xwingView.transform = CGAffineTransformIdentity;
                                          
                                          }completion:nil];
                     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
