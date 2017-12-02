//
//  DataViewController.m
//  First BLE App
//
//  Created by Max Houghton on 01/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.model = [[DataModel alloc] init];
    [self.model initModel];
    
#pragma mark - Setup timer and add to main thread
    
    NSTimer *updateTimer = [NSTimer timerWithTimeInterval:UPDATE_VALUES_INTERVAL
                                                   target:self
                                                 selector:@selector(updateData)
                                                 userInfo:nil
                                                  repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:updateTimer
                              forMode:NSRunLoopCommonModes];
    
#pragma mark - Receive Notifications
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveMagTrixValues:)
                                                 name:@"MagTrixValues"
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) receiveMagTrixValues:(NSNotification *)magTrixDictionary
{
    NSDictionary *magTrixInfo = magTrixDictionary.userInfo;
    
    NSNumber *mlx1_x = (NSNumber *)magTrixInfo[@"mlx1_x"];
    NSNumber *mlx1_y = (NSNumber *)magTrixInfo[@"mlx1_y"];
    NSNumber *mlx1_z = (NSNumber *)magTrixInfo[@"mlx1_z"];
    
    NSNumber *mlx2_x = (NSNumber *)magTrixInfo[@"mlx2_x"];
    NSNumber *mlx2_y = (NSNumber *)magTrixInfo[@"mlx2_y"];
    NSNumber *mlx2_z = (NSNumber *)magTrixInfo[@"mlx2_z"];
    
    NSNumber *mlx3_x = (NSNumber *)magTrixInfo[@"mlx3_x"];
    NSNumber *mlx3_y = (NSNumber *)magTrixInfo[@"mlx3_y"];
    NSNumber *mlx3_z = (NSNumber *)magTrixInfo[@"mlx3_z"];
    
    NSNumber *mlx4_x = (NSNumber *)magTrixInfo[@"mlx4_x"];
    NSNumber *mlx4_y = (NSNumber *)magTrixInfo[@"mlx4_y"];
    NSNumber *mlx4_z = (NSNumber *)magTrixInfo[@"mlx4_z"];

    NSNumber *mlx5_x = (NSNumber *)magTrixInfo[@"mlx5_x"];
    NSNumber *mlx5_y = (NSNumber *)magTrixInfo[@"mlx5_y"];
    NSNumber *mlx5_z = (NSNumber *)magTrixInfo[@"mlx5_z"];
    
    NSNumber *mlx6_x = (NSNumber *)magTrixInfo[@"mlx6_x"];
    NSNumber *mlx6_y = (NSNumber *)magTrixInfo[@"mlx6_y"];
    NSNumber *mlx6_z = (NSNumber *)magTrixInfo[@"mlx6_z"];
    
    NSNumber *mlx7_x = (NSNumber *)magTrixInfo[@"mlx7_x"];
    NSNumber *mlx7_y = (NSNumber *)magTrixInfo[@"mlx7_y"];
    NSNumber *mlx7_z = (NSNumber *)magTrixInfo[@"mlx7_z"];
    
    NSNumber *mlx8_x = (NSNumber *)magTrixInfo[@"mlx8_x"];
    NSNumber *mlx8_y = (NSNumber *)magTrixInfo[@"mlx8_y"];
    NSNumber *mlx8_z = (NSNumber *)magTrixInfo[@"mlx8_z"];
    
    NSNumber *mlx9_x = (NSNumber *)magTrixInfo[@"mlx9_x"];
    NSNumber *mlx9_y = (NSNumber *)magTrixInfo[@"mlx9_y"];
    NSNumber *mlx9_z = (NSNumber *)magTrixInfo[@"mlx9_z"];
    
    NSNumber *mlx10_x = (NSNumber *)magTrixInfo[@"mlx10_x"];
    NSNumber *mlx10_y = (NSNumber *)magTrixInfo[@"mlx10_y"];
    NSNumber *mlx10_z = (NSNumber *)magTrixInfo[@"mlx10_z"];
    
    NSNumber *mlx11_x = (NSNumber *)magTrixInfo[@"mlx11_x"];
    NSNumber *mlx11_y = (NSNumber *)magTrixInfo[@"mlx11_y"];
    NSNumber *mlx11_z = (NSNumber *)magTrixInfo[@"mlx11_z"];

    NSNumber *mlx12_x = (NSNumber *)magTrixInfo[@"mlx12_x"];
    NSNumber *mlx12_y = (NSNumber *)magTrixInfo[@"mlx12_y"];
    NSNumber *mlx12_z = (NSNumber *)magTrixInfo[@"mlx12_z"];
    
    NSNumber *mlx13_x = (NSNumber *)magTrixInfo[@"mlx13_x"];
    NSNumber *mlx13_y = (NSNumber *)magTrixInfo[@"mlx13_y"];
    NSNumber *mlx13_z = (NSNumber *)magTrixInfo[@"mlx13_z"];
    
    NSNumber *mlx14_x = (NSNumber *)magTrixInfo[@"mlx14_x"];
    NSNumber *mlx14_y = (NSNumber *)magTrixInfo[@"mlx14_y"];
    NSNumber *mlx14_z = (NSNumber *)magTrixInfo[@"mlx14_z"];
    
    NSNumber *mlx15_x = (NSNumber *)magTrixInfo[@"mlx15_x"];
    NSNumber *mlx15_y = (NSNumber *)magTrixInfo[@"mlx15_y"];
    NSNumber *mlx15_z = (NSNumber *)magTrixInfo[@"mlx15_z"];

    NSNumber *mlx16_x = (NSNumber *)magTrixInfo[@"mlx16_x"];
    NSNumber *mlx16_y = (NSNumber *)magTrixInfo[@"mlx16_y"];
    NSNumber *mlx16_z = (NSNumber *)magTrixInfo[@"mlx16_z"];
    
    self.model.mlx1.x = [mlx1_x floatValue];
    self.model.mlx1.y = [mlx1_y floatValue];
    self.model.mlx1.z = [mlx1_z floatValue];

    self.model.mlx2.x = [mlx2_x floatValue];
    self.model.mlx2.y = [mlx2_y floatValue];
    self.model.mlx2.z = [mlx2_z floatValue];

    self.model.mlx3.x = [mlx3_x floatValue];
    self.model.mlx3.y = [mlx3_y floatValue];
    self.model.mlx3.z = [mlx3_z floatValue];
    
    self.model.mlx4.x = [mlx4_x floatValue];
    self.model.mlx4.y = [mlx4_y floatValue];
    self.model.mlx4.z = [mlx4_z floatValue];
    
    self.model.mlx5.x = [mlx5_x floatValue];
    self.model.mlx5.y = [mlx5_y floatValue];
    self.model.mlx5.z = [mlx5_z floatValue];
    
    self.model.mlx6.x = [mlx6_x floatValue];
    self.model.mlx6.y = [mlx6_y floatValue];
    self.model.mlx6.z = [mlx6_z floatValue];
    
    self.model.mlx7.x = [mlx7_x floatValue];
    self.model.mlx7.y = [mlx7_y floatValue];
    self.model.mlx7.z = [mlx7_z floatValue];

    self.model.mlx8.x = [mlx8_x floatValue];
    self.model.mlx8.y = [mlx8_y floatValue];
    self.model.mlx8.z = [mlx8_z floatValue];
    
    self.model.mlx9.x = [mlx9_x floatValue];
    self.model.mlx9.y = [mlx9_y floatValue];
    self.model.mlx9.z = [mlx9_z floatValue];
    
    self.model.mlx10.x = [mlx10_x floatValue];
    self.model.mlx10.y = [mlx10_y floatValue];
    self.model.mlx10.z = [mlx10_z floatValue];
    
    self.model.mlx11.x = [mlx11_x floatValue];
    self.model.mlx11.y = [mlx11_y floatValue];
    self.model.mlx11.z = [mlx11_z floatValue];

    self.model.mlx12.x = [mlx12_x floatValue];
    self.model.mlx12.y = [mlx12_y floatValue];
    self.model.mlx12.z = [mlx12_z floatValue];
    
    self.model.mlx13.x = [mlx13_x floatValue];
    self.model.mlx13.y = [mlx13_y floatValue];
    self.model.mlx13.z = [mlx13_z floatValue];
    
    self.model.mlx14.x = [mlx14_x floatValue];
    self.model.mlx14.y = [mlx14_y floatValue];
    self.model.mlx14.z = [mlx14_z floatValue];
    
    self.model.mlx15.x = [mlx15_x floatValue];
    self.model.mlx15.y = [mlx15_y floatValue];
    self.model.mlx15.z = [mlx15_z floatValue];
    
    self.model.mlx16.x = [mlx16_x floatValue];
    self.model.mlx16.y = [mlx16_y floatValue];
    self.model.mlx16.z = [mlx16_z floatValue];
}


- (void) updateData
{
    self.x1Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx1.x];
    self.y1Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx1.y];
    self.z1Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx1.z];
    
    self.x2Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx2.x];
    self.y2Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx2.y];
    self.z2Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx2.z];
    
    self.x3Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx3.x];
    self.y3Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx3.y];
    self.z3Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx3.z];
    
    self.x4Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx4.x];
    self.y4Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx4.y];
    self.z4Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx4.z];
    
    self.x5Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx5.x];
    self.y5Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx5.y];
    self.z5Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx5.z];
    
    self.x6Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx6.x];
    self.y6Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx6.y];
    self.z6Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx6.z];
    
    self.x7Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx7.x];
    self.y7Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx7.y];
    self.z7Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx7.z];
    
    self.x8Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx8.x];
    self.y8Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx8.y];
    self.z8Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx8.z];
    
    self.x9Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx9.x];
    self.y9Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx9.y];
    self.z9Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx9.z];
    
    self.x10Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx10.x];
    self.y10Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx10.y];
    self.z10Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx10.z];
    
    self.x11Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx11.x];
    self.y11Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx11.y];
    self.z11Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx11.z];
    
    self.x12Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx12.x];
    self.y12Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx12.y];
    self.z12Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx12.z];
    
    self.x13Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx13.x];
    self.y13Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx13.y];
    self.z13Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx13.z];
    
    self.x14Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx14.x];
    self.y14Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx14.y];
    self.z14Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx14.z];
    
    self.x15Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx15.x];
    self.y15Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx15.y];
    self.z15Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx15.z];
    
    self.x16Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx16.x];
    self.y16Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx16.y];
    self.z16Label.text = [NSString stringWithFormat:@"%ld", (unsigned long)self.model.mlx16.z];
}

@end
