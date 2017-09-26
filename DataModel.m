//
//  DataModel.m
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

#pragma mark - Initialize model parameters

- (void) initModel
{
    self.userName = @"Max Houghton";
    self.age = 20;
    self.gender = MALE;
    self.height = 180;
    self.weight = 75;
    
    self.fibula = [[Bone alloc] init];
    self.calcaneus = [[Bone alloc] init];
    self.navicular = [[Bone alloc] init];
    self.metatarsal = [[Bone alloc] init];
    self.phalange = [[Bone alloc] init];
    
    self.device1 = [[Device alloc] init];
    self.device2 = [[Device alloc] init];
    
    self.fibula.length = 67;
    self.navicular.length = 25;
    self.calcaneus.length = 17;
    self.metatarsal.length = 24;
    self.phalange.length = 15;
    
    self.device1.rotation_x = 0;
    self.device1.rotation_y = 0;
    self.device1.rotation_z = 0;
    
    self.device2.rotation_x = 0;
    self.device2.rotation_y = 0;
    self.device2.rotation_z = 0;
}

#pragma mark - Calculate

- (NSInteger) calculateDorsiflexion:(NSInteger) fibulaRotation
              forMetatarsalRotation:(NSInteger) metatarsalRotation
{
    // Dorsiflexion is rotation between top of foot and shin in sagittal plane
    NSInteger dorsiflexion = fibulaRotation + metatarsalRotation;
    
    return self.nominalDorsiflexion + dorsiflexion;
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
