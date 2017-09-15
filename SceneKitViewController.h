//
//  SceneKitViewController.h
//  First BLE App
//
//  Created by Max Houghton on 31/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//
#include "Constants.h"

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "DataModel.h"

@import SceneKit;

@interface SceneKitViewController : UIViewController

@property (weak, nonatomic) IBOutlet SCNView *scnView;
@property (weak, nonatomic) IBOutlet UILabel *deviceOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceTwoLabel;

@property (strong, nonatomic) SCNNode *cameraNode;

@property (strong, nonatomic) SCNNode *armatureNode;
@property (strong, nonatomic) SCNNode *fibulaNode;
@property (strong, nonatomic) SCNNode *navicularNode;
@property (strong, nonatomic) SCNNode *calcaneusNode;
@property (strong, nonatomic) SCNNode *metatarsalNode;
@property (strong, nonatomic) SCNNode *phalangeNode;

@property (strong, nonatomic) DataModel *model;

@property (strong, nonatomic) NSMutableArray *rotationArray;

@property float ticker; // dummy value to test updating the position of the model

- (void) receiveAccelerometerValues:(NSNotification *)accelerometerDictionary;
- (void) updateModelPosition;


@end
