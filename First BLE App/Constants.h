//
//  Constants.h
//  First BLE App
//
//  Created by Max Houghton on 29/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#import <UIKit/UIKit.h>

#define PI 3.14159265

#define DEG2RAD PI/180
#define RAD2DEG 180/PI

#define TIMER_SCAN_INTERVAL     2
#define TIMER_PAUSE_INTERVAL    5
#define UPDATE_VALUES_INTERVAL  0.01

#define DEVICE_NAME @"BLE UART"

#define UUID_UART_SERVICE               @"6E400001-B5A3-F393-E0A9-E50E24DCCA9E"
#define UUID_UART_TX_CHARACTERISTIC     @"6E400002-B5A3-F393-E0A9-E50E24DCCA9E"
#define UUID_UART_RX_CHARACTERISTIC     @"6E400003-B5A3-F393-E0A9-E50E24DCCA9E"

#define MAXIMUM_PHALANGE_X_ROTATION     25.0
#define MINIMUM_PHALANGE_X_ROTATION     -20.0

#define MAXIMUM_METATARSAL_X_ROTATION   45.0
#define MINIMUM_METATARSAL_X_ROTATION   8.0
#define METATARSAL_X_OFFSET             26.5

#define MAXIMUM_CALCANEUS_Y_ROTATION    -30.0
#define MINIMUM_CALCANEUS_Y_ROTATION    0.0

typedef NS_OPTIONS(NSUInteger, GENDER) {
    MALE    = 0,
    FEMALE
};

#endif /* Constants_h */
