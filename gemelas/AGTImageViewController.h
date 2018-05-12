//
//  AGTImageViewController.h
//  gemelas
//
//  Created by Eduardo on 8/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AGTImageViewController : UIViewController
- (IBAction)downloadImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

-(void) imageWith:(void (^)(UIImage *image))completionBlock;

@end
