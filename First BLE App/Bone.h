//
//  Bone.h
//  First BLE App
//
//  Created by Max Houghton on 13/09/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bone : NSObject

@property NSInteger length;

@property NSInteger currentXRotation;
@property NSInteger currentYRotation;
@property NSInteger currentZRotation;

@property NSInteger nominalXRotation;
@property NSInteger nominalYRotation;
@property NSInteger nominalZRotation;

- (NSInteger) setMaximumRotation:(NSInteger)maxRotation
              setMinimumRotation:(NSInteger)minRotation
              forCurrentRotation:(NSInteger)currentRotation;

@end
