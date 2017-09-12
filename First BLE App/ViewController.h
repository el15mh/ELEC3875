//
//  ViewController.h
//  First BLE App
//
//  Created by Max Houghton on 17/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TableViewController.h"
#import "SceneKitViewController.h"

#include "DataModel.h"
#include "Device.h"
#include "Constants.h"

@import QuartzCore;
@import CoreBluetooth;

@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralDelegate>

#pragma mark - Model objects

@property (strong, nonatomic) DataModel *model;
@property (strong, nonatomic) Device *accelerometer_1;
@property (strong, nonatomic) Device *accelerometer_2;

#pragma mark - BLE Objects/Properties

@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, assign) BOOL scan;
@property (nonatomic, assign) BOOL connected;

#pragma mark - UIView Properties

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (weak, nonatomic) IBOutlet UILabel *xRotationLabel;
@property (weak, nonatomic) IBOutlet UILabel *yRotationLabel;

@property (strong, nonatomic) NSDictionary *accelerometerDictionary;

- (void) sendAccelerometerValues;

#pragma mark - UIView Methods

- (void) displayData:(NSData *)dataBytes;

- (void) pauseScan;
- (void) resumeScan;


@end

