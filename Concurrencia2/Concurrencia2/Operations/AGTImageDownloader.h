//
//  AGTImageDownloader.h
//  Concurrencia2
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGTImageViewController.h"

@interface AGTImageDownloader : NSOperation

-(id) initWithImageViewController:(AGTImageViewController *) vc;

@end
