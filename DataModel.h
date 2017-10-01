//
//  DataModel.h
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#include "Constants.h"

#include "Bone.h"
#include "Device.h"

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonnull) Bone *fibula;
@property (strong, nonnull) Bone *calcaneus;
@property (strong, nonnull) Bone *navicular;
@property (strong, nonnull) Bone *metatarsal;
@property (strong, nonnull) Bone *phalange;

@property (strong, nonnull) Device *device1;
@property (strong, nonnull) Device *device2;

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
