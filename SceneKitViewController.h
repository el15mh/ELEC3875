//
//  SceneKitViewController.h
//  First BLE App
//
//  Created by Max Houghton on 31/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//
#include "Constants.h"

#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>

#import "ViewController.h"

#import "DataModel.h"

@interface SceneKitViewController : UIViewController

@property (weak, nonatomic) IBOutlet SCNView *scnView;
@property (weak, nonatomic) IBOutlet UILabel *deviceOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceTwoLabel;

@property (strong, nonatomic) SCNNode *cameraNode;

@property (strong, nonatomic) DataModel *model;

- (void) receiveAccelerometerValues:(NSNotification *)accelerometerDictionary;



@end
