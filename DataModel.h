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

@property (strong, nonatomic) Bone *fibula;
@property (strong, nonatomic) Bone *calcaneus;
@property (strong, nonatomic) Bone *navicular;
@property (strong, nonatomic) Bone *metatarsal;
@property (strong, nonatomic) Bone *phalange;

@property (strong, nonatomic) Device *device1;
@property (strong, nonatomic) Device *device2;

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

- (NSInteger) calculateInversion;
- (NSInteger) calculateAdduction;


@end
