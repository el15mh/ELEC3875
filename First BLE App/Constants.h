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

#define DEG2RAD 3.14159/180
#define RAD2DEG 180/3.14159

#define TIMER_SCAN_INTERVAL 2.0
#define TIMER_PAUSE_INTERVAL 5.0

#define UPDATE_VALUES_INTERVAL 0.1

#define DEVICE_NAME @"nRF52"

#define UUID_HEALTH_THERMOMETER_SERVICE @"0x1809"
#define UUID_TEMPERATURE_CHARACTERISTIC @"0x2A1C"

#define UUID_BATTERY_SERVICE @"0x180F"
#define UUID_BATTERY_LEVEL_STATE_CHAR @"0x2A1B"

#define UUID_CUSTOM_GATT_SERVICE @"0xA000"
#define UUID_CUSTOM_GATT_CHARACTERISTIC @"0xA001"

#define UUID_ACCELEROMETER_SERVICE  @"00000000-0000-1000-7450-BE2E44B06B00"

#define UUID_X_CHARACTERISTIC       @"00000000-0000-1000-7450-BE2E44B06B01"
#define UUID_Y_CHARACTERISTIC       @"00000000-0000-1000-7450-BE2E44B06B02"
#define UUID_Z_CHARACTERISTIC       "@00000000-0000-1000-7450-BE2E44B06B03"

#define MAXIMUM_PHALANGE_X_ROTATION 25.0
#define MINIMUM_PHALANGE_X_ROTATION -20.0

#define MAXIMUM_METATARSAL_X_ROTATION 45.0
#define MINIMUM_METATARSAL_Y_ROTATION 8.0

typedef NS_OPTIONS(NSUInteger, GENDER) {
    MALE    = 0,
    FEMALE
};

#endif /* Constants_h */
