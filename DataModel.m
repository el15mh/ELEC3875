//
//  DataModel.m
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (void) initModel
{
    self.userName = @"Max Houghton";
    self.age = 20;
    self.gender = MALE;
    self.height = 180;
    self.weight = 75;
}

- (NSInteger) calculateDorsiflexion
{
    NSInteger dorsiflextion = 0;
    
    return self.nominalDorsiflexion + dorsiflextion;
}

- (NSInteger) calculateInversion
{
    NSInteger inversion = 0;
    
    return self.nominalInversion + inversion;
}

- (NSInteger) calculateAdduction
{
    NSInteger adduction = 0;
    
    return self.nominalAdduction + adduction;
}

@end
