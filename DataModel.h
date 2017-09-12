//
//  DataModel.h
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#include "Constants.h"

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonnull) NSString *userName;

@property NSInteger gender;
@property NSInteger age;
@property NSInteger height;
@property NSInteger weight;

@property NSInteger phalangeLength;
@property NSInteger metatarsalLength;
@property NSInteger calcaneusLength;
@property NSInteger fibulaLength;

@property NSInteger A1Position;         // Distance from A1 to ankle
@property NSInteger A2Position;         // Distance from ankle to A2

@property NSInteger rotationA1_x;
@property NSInteger rotationA1_y;
@property NSInteger rotationA1_z;

@property NSInteger rotationA2_x;
@property NSInteger rotationA2_y;
@property NSInteger rotationA2_z;

@property NSInteger nominalDorsiflexion;
@property NSInteger nominalInversion;
@property NSInteger nominalAdduction;

- (void) initModel;

- (NSInteger) calculateDorsiflexion;
- (NSInteger) calculateInversion;
- (NSInteger) calculateAdduction;


@end
