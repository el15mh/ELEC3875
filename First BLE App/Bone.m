//
//  Bone.m
//  First BLE App
//
//  Created by Max Houghton on 13/09/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Bone.h"

@implementation Bone

- (NSInteger) findCurrentPosition:(NSInteger)currentPosition
               forMaximumRotation:(NSInteger)maximumRotation
               forMinimumRotation:(NSInteger)mininumRotation
{
    if (currentPosition >= maximumRotation) return maximumRotation;
    else if (currentPosition <= mininumRotation) return mininumRotation;
    else return currentPosition;
}

@end
