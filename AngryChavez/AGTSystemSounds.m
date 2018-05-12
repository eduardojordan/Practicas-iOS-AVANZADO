//
//  AGTSystemSounds.m
//  AngryChavez
//
//  Created by Eduardo on 11/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import "AGTSystemSounds.h"
@import AVFoundation;

#define FOREVER -1

@interface AGTSystemSounds()
@property(nonatomic,strong) AVAudioPlayer *player;
@end

@implementation AGTSystemSounds



+(instancetype)shareSystemSound{
    
    static AGTSystemSounds *shared;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shared = [[AGTSystemSounds alloc]init];
    });
    return shared;
}
-(void) punch{
    [self playFileNamed:@"punch" extension:@"wav" numberOfLoops:0];
}
-(void) starMachineGun{
    [self playFileNamed:@"machineGunLoop" extension:@"wav" numberOfLoops:FOREVER];
}
-(void) stopMachineGun{
    [self.player stop];
}
-(void) binLaden{
    [self playFileNamed:@"CHAVEZ_PATRIA_QUERIDA" extension:@"mp3" numberOfLoops:0];
}
-(void) tape{
    [self playFileNamed:@"tape" extension:@"caf" numberOfLoops:0];
}
-(void) untape{
    [self playFileNamed:@"untape" extension:@"caf" numberOfLoops:0];
}
-(void) playFileNamed: (NSString *)name
            extension: (NSString * )extension
        numberOfLoops: (NSInteger) loops{
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:name withExtension:extension];
    
    NSError *err = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                        error:&err];
    if (self.player){
        // No hubo error
        self.player.numberOfLoops = loops;
        [self.player play];
        
        
    }else{
        NSLog(@"Error reading %@: %@", url, err);
    }
}
@end
