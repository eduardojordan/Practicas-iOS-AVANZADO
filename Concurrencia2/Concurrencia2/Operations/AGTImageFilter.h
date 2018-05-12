//
//  AGTImageFilter.h
//  Concurrencia2
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AGTImageViewcontroller;

@interface AGTImageFilter : NSOperation

-(id) initWithImageViewController: (AGTImageViewcontroller *)vc;

@end
