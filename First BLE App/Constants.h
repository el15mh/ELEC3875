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
#define UPDATE_VALUES_INTERVAL  0.1

#define DEVICE_NAME @"BLE UART"

#define UUID_HEALTH_THERMOMETER_SERVICE @"0x1809"
#define UUID_TEMPERATURE_CHARACTERISTIC @"0x2A1C"

#define UUID_BATTERY_SERVICE            @"0x180F"
#define UUID_BATTERY_LEVEL_STATE_CHAR   @"0x2A1B"

#define UUID_UART_SERVICE               @"6E400001-B5A3-F393-E0A9-E50E24DCCA9E"

#define UUID_HEART_RATE_SERVICE         @"0x180D"
#define UUID_HR_CHARACTERISTIC          @"0x2A37"

#define UUID_CUSTOM_GATT_SERVICE        @"0xA000"
#define UUID_CUSTOM_GATT_CHARACTERISTIC @"0xA001"

#define UUID_ACCELEROMETER_SERVICE      @"00000000-0000-1000-7450-BE2E44B06B00"

#define UUID_X_CHARACTERISTIC           @"00000000-0000-1000-7450-BE2E44B06B01"
#define UUID_Y_CHARACTERISTIC           @"00000000-0000-1000-7450-BE2E44B06B02"
#define UUID_Z_CHARACTERISTIC           @"00000000-0000-1000-7450-BE2E44B06B03"

#define MAXIMUM_PHALANGE_X_ROTATION     25.0
#define MINIMUM_PHALANGE_X_ROTATION     -20.0

#define MAXIMUM_METATARSAL_X_ROTATION   45.0
#define MINIMUM_METATARSAL_X_ROTATION   8.0
#define METATARSAL_X_OFFSET             28.0

#define MAXIMUM_CALCANEUS_Y_ROTATION    -30.0
#define MINIMUM_CALCANEUS_Y_ROTATION    0.0

typedef NS_OPTIONS(NSUInteger, GENDER) {
    MALE    = 0,
    FEMALE
};

#endif /* Constants_h */
