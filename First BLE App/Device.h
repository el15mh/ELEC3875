//
//  Device.h
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property (strong, nonatomic) NSString *name;

@property NSInteger rotation_x;
@property NSInteger rotation_y;
@property NSInteger rotation_z;

@end
