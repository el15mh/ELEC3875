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
    self.age = 21;
    self.gender = MALE;
    self.height = 180;
    self.weight = 75;
    
    self.fibula = [[Bone alloc] init];
    self.calcaneus = [[Bone alloc] init];
    self.navicular = [[Bone alloc] init];
    self.metatarsal = [[Bone alloc] init];
    self.phalange = [[Bone alloc] init];
        
    self.fibula.name = @"fibula";
    self.navicular.name = @"navicular";
    self.calcaneus.name = @"calcaneus";
    self.metatarsal.name = @"metatarsal";
    self.phalange.name = @"phalange";
    
    self.acc1 = [[Accelerometer alloc] init];
    self.acc2 = [[Accelerometer alloc] init];
    
    self.mlx1 = [[MLX90393 alloc] init];
    self.mlx2 = [[MLX90393 alloc] init];
    self.mlx3 = [[MLX90393 alloc] init];
    self.mlx4 = [[MLX90393 alloc] init];
    self.mlx5 = [[MLX90393 alloc] init];
    self.mlx6 = [[MLX90393 alloc] init];
    self.mlx7 = [[MLX90393 alloc] init];
    self.mlx8 = [[MLX90393 alloc] init];
    self.mlx9 = [[MLX90393 alloc] init];
    self.mlx10 = [[MLX90393 alloc] init];
    self.mlx11 = [[MLX90393 alloc] init];
    self.mlx12 = [[MLX90393 alloc] init];
    self.mlx13 = [[MLX90393 alloc] init];
    self.mlx14 = [[MLX90393 alloc] init];
    self.mlx15 = [[MLX90393 alloc] init];
    self.mlx16 = [[MLX90393 alloc] init];
    
    self.mlx5.z = 36.3f;
    
    self.fibula.length = 67;
    self.navicular.length = 25;
    self.calcaneus.length = 17;
    self.metatarsal.length = 24;
    self.phalange.length = 15;
    
    self.acc1.rotation_x = 0;
    self.acc1.rotation_y = 0;
    self.acc1.rotation_z = 0;
    
    self.acc2.rotation_x = 0;
    self.acc2.rotation_y = 0;
    self.acc2.rotation_z = 0;
}

#pragma mark - Calculate

- (NSInteger) calculateDorsiflexion:(NSInteger) fibulaRotation
              forMetatarsalRotation:(NSInteger) metatarsalRotation
{
    // Dorsiflexion is rotation between top of foot and shin in sagittal plane
    NSInteger dorsiflexion = fibulaRotation + metatarsalRotation;
    
    return self.nominalDorsiflexion + dorsiflexion;
}

- (NSInteger) calculateRotation:(NSInteger)rotation
                         onAxis:(NSString *)axis
                        forBone:(Bone *)bone
{
    if ([axis isEqualToString:@"x"])
    {
        if ([bone.name isEqualToString:@"metatarsal"]) {
            if (rotation >= MAXIMUM_METATARSAL_X_ROTATION) return MAXIMUM_METATARSAL_X_ROTATION;
            else if (rotation <= MINIMUM_METATARSAL_X_ROTATION) return MINIMUM_METATARSAL_X_ROTATION;
            else return rotation;
        }
        
        else if ([bone.name isEqualToString:@"phalange"]) {
            if (rotation >= MAXIMUM_PHALANGE_X_ROTATION) return MAXIMUM_PHALANGE_X_ROTATION;
            else if (rotation <= MINIMUM_PHALANGE_X_ROTATION) return MINIMUM_PHALANGE_X_ROTATION;
            else return rotation;
        }
    }
    
    return rotation;
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
