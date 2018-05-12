//
//  main.m
//  iteraccion
//
//  Created by Eduardo on 8/5/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        // NSarray
        NSArray *list = @[@1,@2,@3];
        
        // for de C del abuelo
        for (int i = 0; i < [list count]; i++) {
            NSLog(@"El elemento %d vale %@", i ,[list objectAtIndex:i] );
        }
        // Fast iteraction
        
        for (id element in list) {
             NSLog(@"El elemento vale %@" ,element );
            
        }
        //Bloques
        [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"El elemento %lu vale %@", (unsigned long)idx , obj );
        }];
        
        //NSDictionary
        
        NSDictionary *dict = @{@"uno": @1,@"dos": @2};
        [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog (@"La clave %@ apunta a objeto %@", key ,obj );
        }];
    }
    return 0;
}
