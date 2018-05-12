//
//  AGTSystemSounds.h
//  AngryChavez
//
//  Created by Eduardo on 11/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AGTSystemSounds : NSObject


+(instancetype)shareSystemSound;

-(void) punch;
-(void) starMachineGun;
-(void) stopMachineGun;
-(void) binLaden;
-(void) tape;
-(void) untape;


@end
