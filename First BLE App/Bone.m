//
//  Bone.m
//  First BLE App
//
//  Created by Max Houghton on 13/09/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Bone.h"

@implementation Bone

- (NSInteger) setMaximumRotation:(NSInteger)maxRotation
              setMinimumRotation:(NSInteger)minRotation
              forCurrentRotation:(NSInteger)currentRotation
{
    if (currentRotation >= maxRotation) return maxRotation;
    else if (currentRotation <= minRotation) return minRotation;
    else return currentRotation;
}

@end
