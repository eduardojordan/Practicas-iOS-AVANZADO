//
//  AGTChavezViewController.m
//  AngryChavez
//
//  Created by Eduardo on 11/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTChavezViewController.h"
#import "AGTSystemSounds.h"

@interface AGTChavezViewController ()
@property (strong, nonatomic) UIImageView *lastShot;

@property(strong, nonatomic)NSArray *showSprite;
@property(strong,nonatomic)NSArray *hideSpride;

//@property (strong,nonatomic)UIImageView *tapeView;
@property(nonatomic) CGPoint lastTouch;
@property(nonatomic,strong) UIImageView *tapeView;

@end

@implementation AGTChavezViewController


-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.title = @"Angry Chavez";
    
    
    //Sprites
    self.showSprite = @[[UIImage imageNamed:@"tape1.png"],[UIImage imageNamed:@"tape2.png"],
                        [UIImage imageNamed:@"tape3.png"],[UIImage imageNamed:@"tape4.png"]];
    
    self.hideSpride = @[[UIImage imageNamed:@"tape4.png"],[UIImage imageNamed:@"tape3.png"],
                        [UIImage imageNamed:@"tape2.png"],[UIImage imageNamed:@"tape1.png"]];
    
    
    // creamos los reconocedores
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(didTap:)];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector (didPan:)];


    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]
                                       initWithTarget:self action:@selector (didSwipe:)];
    
    //Añadir los gestures reconizer a la vista
    
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:pan];
    [self.view addGestureRecognizer:swipe];
}

#pragma mark -Actions

-(void)didTap : (UITapGestureRecognizer *)tap{
    if(tap.state == UIGestureRecognizerStateRecognized){
        UIImageView *crack = [[UIImageView alloc]
                              initWithImage:[UIImage imageNamed:@"crackedGlass.png"]];
        crack.center = [tap locationInView:self.chavezView];
        [self.chavezView addSubview:crack];
        
        // reproducir un sonido
        
        [self playPunch];
    }
}

-(void)didPan : (UIPanGestureRecognizer *)pan{
    
    
    if (pan.state == UIGestureRecognizerStateChanged){
        
        CGPoint currentPosition = [pan locationInView:self.chavezView];
        CGRect lastShot = self.lastShot.frame;
        
        if(!CGRectContainsPoint(lastShot, currentPosition)){
        
        UIImageView *shot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BulletHole.png"]];
            shot.center = currentPosition;
        [self.chavezView addSubview:shot];
            
            self.lastShot = shot;
        }
    }else if (pan.state == UIGestureRecognizerStateBegan){
        //empezamos a ametrallar a Chavez
         [[AGTSystemSounds shareSystemSound]starMachineGun];
    }else if (pan.state == UIGestureRecognizerStateEnded){
         [[AGTSystemSounds shareSystemSound]stopMachineGun];
    }
}

-(void) didSwipe: (UISwipeGestureRecognizer * )swipe{
    if (swipe.state == UIGestureRecognizerStateRecognized){
        
        if(!self.tapeView){
            //No esta callada y hay que poner la cinta
             [[AGTSystemSounds shareSystemSound]tape];
            
            self.tapeView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tape4.png"]];
            self.tapeView.animationImages = self.showSprite;
            self.tapeView.animationRepeatCount= 1;
            self.tapeView.animationDuration = 0.2;
            
            self.tapeView.center = [swipe locationInView:self.chavezView];
            [self.chavezView addSubview:self.tapeView];
            
            [self.tapeView startAnimating];
            
        }else{
            //hay que quitarle la cinta
             [[AGTSystemSounds shareSystemSound]untape];
            
            self.tapeView.animationImages = self.hideSpride;
            self.tapeView.image = nil;
            
            [self.tapeView startAnimating];
            
            dispatch_after
            (dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)),
             dispatch_get_main_queue(), ^{
                 
                 //quitar la tapeview
                 [self.tapeView removeFromSuperview];
                 self.tapeView = nil;
            });
            
            
        }
    }
    
    
}

#pragma mark -Shake
-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    if (motion == UIEventSubtypeMotionShake){
        //sacudida que te crio
        for (UIView *view in self.chavezView.subviews){
            [view removeFromSuperview];
        }
        self.tapeView = nil;
        
         [[AGTSystemSounds shareSystemSound]binLaden];
        
    }
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}
#pragma mark - Sound

-(void) playPunch{
    [[AGTSystemSounds shareSystemSound]punch];
}
@end
