//
//  Device.h
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accelerometer : NSObject

@property NSInteger position;   // distance from ankle joint to each accelerometer

@property NSInteger rotation_x; // current angular position
@property NSInteger rotation_y;
@property NSInteger rotation_z;

@property NSInteger nominal_x;  // intial angular position
@property NSInteger nominal_y;
@property NSInteger nominal_z;

@end
