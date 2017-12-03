//
//  DataViewController.h
//  First BLE App
//
//  Created by Max Houghton on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//
#include "Constants.h"

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "DataModel.h"

@interface DataViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *x1Label;
@property (weak, nonatomic) IBOutlet UILabel *x2Label;
@property (weak, nonatomic) IBOutlet UILabel *x3Label;
@property (weak, nonatomic) IBOutlet UILabel *x4Label;
@property (weak, nonatomic) IBOutlet UILabel *x5Label;
@property (weak, nonatomic) IBOutlet UILabel *x6Label;
@property (weak, nonatomic) IBOutlet UILabel *x7Label;
@property (weak, nonatomic) IBOutlet UILabel *x8Label;
@property (weak, nonatomic) IBOutlet UILabel *x9Label;
@property (weak, nonatomic) IBOutlet UILabel *x10Label;
@property (weak, nonatomic) IBOutlet UILabel *x11Label;
@property (weak, nonatomic) IBOutlet UILabel *x12Label;
@property (weak, nonatomic) IBOutlet UILabel *x13Label;
@property (weak, nonatomic) IBOutlet UILabel *x14Label;
@property (weak, nonatomic) IBOutlet UILabel *x15Label;
@property (weak, nonatomic) IBOutlet UILabel *x16Label;

@property (weak, nonatomic) IBOutlet UILabel *y1Label;
@property (weak, nonatomic) IBOutlet UILabel *y2Label;
@property (weak, nonatomic) IBOutlet UILabel *y3Label;
@property (weak, nonatomic) IBOutlet UILabel *y4Label;
@property (weak, nonatomic) IBOutlet UILabel *y5Label;
@property (weak, nonatomic) IBOutlet UILabel *y6Label;
@property (weak, nonatomic) IBOutlet UILabel *y7Label;
@property (weak, nonatomic) IBOutlet UILabel *y8Label;
@property (weak, nonatomic) IBOutlet UILabel *y9Label;
@property (weak, nonatomic) IBOutlet UILabel *y10Label;
@property (weak, nonatomic) IBOutlet UILabel *y11Label;
@property (weak, nonatomic) IBOutlet UILabel *y12Label;
@property (weak, nonatomic) IBOutlet UILabel *y13Label;
@property (weak, nonatomic) IBOutlet UILabel *y14Label;
@property (weak, nonatomic) IBOutlet UILabel *y15Label;
@property (weak, nonatomic) IBOutlet UILabel *y16Label;

@property (weak, nonatomic) IBOutlet UILabel *z1Label;
@property (weak, nonatomic) IBOutlet UILabel *z2Label;
@property (weak, nonatomic) IBOutlet UILabel *z3Label;
@property (weak, nonatomic) IBOutlet UILabel *z4Label;
@property (weak, nonatomic) IBOutlet UILabel *z5Label;
@property (weak, nonatomic) IBOutlet UILabel *z6Label;
@property (weak, nonatomic) IBOutlet UILabel *z7Label;
@property (weak, nonatomic) IBOutlet UILabel *z8Label;
@property (weak, nonatomic) IBOutlet UILabel *z9Label;
@property (weak, nonatomic) IBOutlet UILabel *z10Label;
@property (weak, nonatomic) IBOutlet UILabel *z11Label;
@property (weak, nonatomic) IBOutlet UILabel *z12Label;
@property (weak, nonatomic) IBOutlet UILabel *z13Label;
@property (weak, nonatomic) IBOutlet UILabel *z14Label;
@property (weak, nonatomic) IBOutlet UILabel *z15Label;
@property (weak, nonatomic) IBOutlet UILabel *z16Label;

@property (strong, nonnull) DataModel *model;

- (void) receiveMagTrixValues:(NSNotification *)magTrixDictionary;
- (void) updateData;

@end
