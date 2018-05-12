//
//  AGTImageFilter.m
//  Concurrencia2
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTImageFilter.h"
#import "AGTImageViewController.h"

@import CoreImage;


@interface AGTImageFilter ()
@property (strong, nonatomic ) AGTImageViewController *iVC;
@end

@implementation AGTImageFilter

-(id) initWithImageViewController: (AGTImageViewController *)vc{
    
    if(self = [super init]){
        _iVC = vc;
    }
    return self;
}

-(void) updateViewControllerBeforeBackground{
    [self.iVC.activityView startAnimating];
    
}

-(void) updateViewControllerAfterBackgroundWithImage: (UIImage *)image {
    
    [self.iVC.activityView stopAnimating];
    self.iVC.imageView.image = image;
    
    
}

-(void) main{
    
    // actualizamos el primer plano
    [self performSelectorOnMainThread:@selector(updateViewControllerBeforeBackground)
                           withObject:nil
                        waitUntilDone:NO];
    //crear un contexto
    CIContext *context = [CIContext contextWithOptions:nil];
    //creamos una CIImage
    CIImage *image = [CIImage imageWithCGImage:self.iVC.imageView.image.CGImage];
    //creamos un filtro de color
    CIFilter *falseColor = [CIFilter filterWithName:@"CiFalseColor"];
    [falseColor setDefaults];
    [falseColor setValue:image forKey:kCIInputImageKey];
    //creamos una imagen de salida
    CIImage *output = falseColor.outputImage;
    
    //Generamos la imagen
    CGImageRef res = [context createCGImage:output
                                   fromRect:[output extent]];
    
    // actualizamos el primer plano
    [self performSelectorOnMainThread:@selector(updateViewControllerAfterBackgroundWithImage:)
                           withObject:[UIImage imageWithCGImage:res]
                        waitUntilDone:NO];
    
    // liberar la CGImageRef
    CGImageRelease(res);
}
@end
