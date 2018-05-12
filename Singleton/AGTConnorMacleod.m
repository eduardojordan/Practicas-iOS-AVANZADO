//
//  AGTConnorMacleod.m
//  Singleton
//
//  Created by Eduardo on 10/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTConnorMacleod.h"

@implementation AGTConnorMacleod


+(instancetype) sharedConnorMacLeod{
    
    static dispatch_once_t onceToken;
    static AGTConnorMacleod *shared;
    dispatch_once(&onceToken, ^{
        shared = [[AGTConnorMacleod alloc]init];
    });
    return shared;
}

@end
