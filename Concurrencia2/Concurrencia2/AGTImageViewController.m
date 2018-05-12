
//
//  AGTImageViewController.m
//  Concurrencia2
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTImageViewController.h"
#import "AGTImageDownloader.h"
#import "AGTImageFilter.h"

@interface AGTImageViewController ()
@property (nonatomic,strong)NSOperationQueue *queue;
@end

@implementation AGTImageViewController

-(id)initWithNibName : (NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName: nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Custom initialization
        _queue = [[NSOperationQueue alloc]init];
    }
    return self;
}

- (IBAction)downloadImage:(id)sender {
    
    
    //Preparar la interfaz
    [self.activityView startAnimating];
    
    //Crear las operaciones
    AGTImageDownloader *downloader = [[AGTImageDownloader alloc]initWithImageViewController:self];
    AGTImageFilter *filter = [[AGTImageFilter alloc]initWithImageViewController: self];
  
    //Enlazarlas
//    [self.queue addOperation:downloader];
    [filter addDependency:downloader];
   
    //Mandarlas a la cola
    [self.queue addOperation:downloader];
    [self.queue addOperation:filter];
}
@end
