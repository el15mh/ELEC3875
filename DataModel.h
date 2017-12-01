//
//  DataModel.h
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#include "Constants.h"

#include "Bone.h"
#include "Accelerometer.h"
#include "MLX90393.h"

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonnull) Bone *fibula;
@property (strong, nonnull) Bone *calcaneus;
@property (strong, nonnull) Bone *navicular;
@property (strong, nonnull) Bone *metatarsal;
@property (strong, nonnull) Bone *phalange;

@property (strong, nonnull) Accelerometer *acc1;
@property (strong, nonnull) Accelerometer *acc2;

@property (strong, nonatomic) MLX90393 *mlx1;
@property (strong, nonatomic) MLX90393 *mlx2;
@property (strong, nonatomic) MLX90393 *mlx3;
@property (strong, nonatomic) MLX90393 *mlx4;
@property (strong, nonatomic) MLX90393 *mlx5;
@property (strong, nonatomic) MLX90393 *mlx6;
@property (strong, nonatomic) MLX90393 *mlx7;
@property (strong, nonatomic) MLX90393 *mlx8;
@property (strong, nonatomic) MLX90393 *mlx9;
@property (strong, nonatomic) MLX90393 *mlx10;
@property (strong, nonatomic) MLX90393 *mlx11;
@property (strong, nonatomic) MLX90393 *mlx12;
@property (strong, nonatomic) MLX90393 *mlx13;
@property (strong, nonatomic) MLX90393 *mlx14;
@property (strong, nonatomic) MLX90393 *mlx15;
@property (strong, nonatomic) MLX90393 *mlx16;

@property (strong, nonnull) NSString *userName;

@property NSInteger gender;
@property NSInteger age;
@property NSInteger height;
@property NSInteger weight;

@property NSInteger nominalDorsiflexion;
@property NSInteger nominalInversion;
@property NSInteger nominalAdduction;

- (void) initModel;

- (NSInteger) calculateDorsiflexion:(NSInteger) fibulaRotation
              forMetatarsalRotation:(NSInteger) metatarsalRotation;

- (NSInteger) calculateRotation:(NSInteger)rotation
                         onAxis:(NSString *)axis
                        forBone:(Bone *)bone;

- (NSInteger) calculateInversion;
- (NSInteger) calculateAdduction;


@end
