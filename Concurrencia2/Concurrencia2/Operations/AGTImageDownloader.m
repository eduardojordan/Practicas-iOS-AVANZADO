//
//  AGTImageDownloader.m
//  Concurrencia2
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTImageDownloader.h"


@interface AGTImageDownloader()
@property (strong,nonatomic) AGTImageViewController *iVC;
@end


@implementation AGTImageDownloader

-(id) initWithImageViewController:(AGTImageViewController *) vc{
    
    if (self = [super init]){
        self.iVC= vc;
    }
        return self;
}


-(void) main{
    
    NSURL *url = [NSURL URLWithString: @"http://los40co00.epimg.net/los40/imagenes/2016/08/12/album/1470959911_662097_1470960060_album_normal.jpg" ];
    
    NSData *data = [NSData dataWithContentsOfURL:url ];
    UIImage *image = [UIImage imageWithData:data];
    
    [self performSelectorOnMainThread:@selector(updateViewControllerWithImage:)
                           withObject:image
                        waitUntilDone:NO];

    
}

-(void) updateViewControllerWithImage: (UIImage *) image{
    self.iVC.imageView.image = image;
    [self.iVC.activityView stopAnimating];
    
    
}
@end
