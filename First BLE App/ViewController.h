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
#include "Constants.h"

@import QuartzCore;
@import CoreBluetooth;

@interface ViewController : UIViewController <CBCentralManagerDelegate, CBPeripheralDelegate>

#pragma mark - Model objects

@property (strong, nonatomic) DataModel *model;

#pragma mark - BLE Objects/Properties

@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) NSNumber *RSSI;
@property (nonatomic, strong) NSMutableArray *bleDevicesArray;
@property (nonatomic, assign) BOOL scan;
@property (nonatomic, assign) BOOL connected;

@property NSInteger counter;

#pragma mark - UIView Properties

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightLabel;

@property (weak, nonatomic) IBOutlet UILabel *fibulaLabel;
@property (weak, nonatomic) IBOutlet UILabel *navicularLabel;
@property (weak, nonatomic) IBOutlet UILabel *calcaneusLabel;
@property (weak, nonatomic) IBOutlet UILabel *metatarsalLabel;
@property (weak, nonatomic) IBOutlet UILabel *phalangeLabel;

@property (weak, nonatomic) IBOutlet UILabel *statusLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *statusLabelTwo;

@property (weak, nonatomic) IBOutlet UILabel *xRotationLabel;
@property (weak, nonatomic) IBOutlet UILabel *yRotationLabel;

@property (weak, nonatomic) IBOutlet UISwitch *scanSwitch;
@property (weak, nonatomic) IBOutlet UIImageView *bluetoothLogo;

@property (strong, nonatomic) NSDictionary *accelerometerDictionary;
@property (strong, nonatomic) NSDictionary *magTrixDictionary;

#pragma mark - UIView Methods

- (void) resumeScan;
- (void) pauseScan;

- (IBAction)scanSwitchPressed:(UISwitch *)sender;

- (void) displayData:(NSData *)dataBytes
   forCharacteristic:(CBCharacteristic *)characteristic;
- (void) sendNotifications;


@end

