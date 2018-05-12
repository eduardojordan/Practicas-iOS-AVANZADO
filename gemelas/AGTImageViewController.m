//
//  AGTImageViewController.m
//  gemelas
//
//  Created by Eduardo on 8/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTImageViewController.h"

@interface AGTImageViewController ()

@end

@implementation AGTImageViewController







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) imageWith:(void (^)(UIImage *image))completionBlock{
    
    //bajar la imagen en 2do plano
    dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(download , ^{
        NSURL *url = [NSURL URLWithString:@"http://los40co00.epimg.net/los40/imagenes/2016/08/12/album/1470959911_662097_1470960060_album_normal.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //ejecutar bloque de finalizacion
            UIImage *image = [UIImage imageWithData : imageData];
            completionBlock (image);
      
        });
        
    });

}





- (IBAction)downloadImage:(id)sender {
    

    [self imageWith:^(UIImage *image) {
        self.photoView.image = image;
    }];

  
}

@end
