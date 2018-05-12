//
//  AGTImageViewController.h
//  Concurrencia2
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGTImageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)downloadImage:(id)sender;

@end
