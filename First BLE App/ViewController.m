//
//  ViewController.m
//  First BLE App
//
//  Created by Max Houghton on 17/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <passData>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib
    
    self.model = [[DataModel alloc] init];
    
    self.bleDevicesArray = [NSMutableArray array];
    
    [self.model initModel];
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self
                                                               queue:nil
                                                             options:nil];
    
    // Initialize all values to 0
    
    self.fibulaLabel.text = [NSString stringWithFormat:@"Fibula: %ld mm", (long)self.model.fibula.length];
    self.navicularLabel.text = [NSString stringWithFormat:@"Navicular: %ld mm", (long)self.model.navicular.length];
    self.calcaneusLabel.text = [NSString stringWithFormat:@"Calcaneus: %ld mm", (long)self.model.calcaneus.length];
    self.metatarsalLabel.text = [NSString stringWithFormat:@"Metatarsal: %ld mm", (long)self.model.metatarsal.length];
    self.phalangeLabel.text = [NSString stringWithFormat:@"Phalanges: %ld mm", (long)self.model.phalange.length];
    
    self.model.acc1.position = 0;
    self.model.acc2.position = 0;
    
    self.userNameLabel.text = [NSString stringWithFormat:@"Name: %@", self.model.userName];
    self.ageLabel.text = [NSString stringWithFormat:@"Age: %ld", (long)self.model.age];
    
    if (self.model.gender == MALE) self.sexLabel.text = @"Gender: Male";
    else self.sexLabel.text = @"Gender: Female";
    
    self.heightLabel.text = [NSString stringWithFormat:@"Height: %ld", (long)self.model.height];
    self.weightLabel.text = [NSString stringWithFormat:@"Weight: %ld", (long)self.model.weight];
    
    self.statusLabelOne.text = @"";
    self.statusLabelTwo.text = @"";
    self.connected = false;
    
    [self.bluetoothLogo setHidden:false];
    self.counter = 0;
    
    NSTimer *updateValuesTimer = [NSTimer timerWithTimeInterval:UPDATE_VALUES_INTERVAL
                                                         target:self
                                                       selector:@selector(sendNotifications)
                                                       userInfo:nil
                                                        repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:updateValuesTimer
                              forMode:NSRunLoopCommonModes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    // When view appears, set data labels to current profile
    self.userNameLabel.text =   [NSString stringWithFormat:@"Name: %@", self.model.userName];
    self.ageLabel.text =        [NSString stringWithFormat:@"Age: %ld", (long)self.model.age];
    
    if (self.model.gender == MALE) self.sexLabel.text = @"Gender: Male";
    else self.sexLabel.text = @"Gender: Female";
    
    self.heightLabel.text = [NSString stringWithFormat:@"Height: %ld cm", (long)self.model.height];
    self.weightLabel.text = [NSString stringWithFormat:@"Weight: %ld kg", (long)self.model.weight];
    
    self.fibulaLabel.text = [NSString stringWithFormat:@"Fibula: %ld mm", (long)self.model.fibula.length];
    self.navicularLabel.text = [NSString stringWithFormat:@"Navicular: %ld mm", (long)self.model.navicular.length];
    self.calcaneusLabel.text = [NSString stringWithFormat:@"Calcaneus: %ld mm", (long)self.model.calcaneus.length];
    self.metatarsalLabel.text = [NSString stringWithFormat:@"Metatarsal: %ld mm", (long)self.model.metatarsal.length];
    self.phalangeLabel.text = [NSString stringWithFormat:@"Phalanges: %ld mm", (long)self.model.phalange.length];
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue
                sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetails"])
    {
        UINavigationController *navController = segue.destinationViewController;
        
        TableViewController *tableVC = (TableViewController *)navController.topViewController;
        
        [tableVC setDelegate:self];
    }
}

#pragma mark - Pass Data Protocol Methods

- (void) setName:(NSString *)name           { self.model.userName = name; }
- (void) setAge:(NSInteger)age              { self.model.age = age; }
- (void) setGender:(NSInteger)gender        { self.model.gender = gender; }
- (void) setHeight:(NSInteger)height        { self.model.height = height; }
- (void) setWeight:(NSInteger)weight        { self.model.weight = weight; }
- (void) setA1:(NSInteger)A1Position        {  self.model.acc1.position = A1Position; }
- (void) setA2:(NSInteger)A2Position        { self.model.acc2.position = A2Position; }
- (void) setFibula:(NSInteger)fibula        {  self.model.fibula.length = fibula; }
- (void) setCalcaneus:(NSInteger)calcaneus  { self.model.calcaneus.length = calcaneus; }
- (void) setNavicular:(NSInteger)navicular  { self.model.navicular.length = navicular; }
- (void) setMetatarsal:(NSInteger)metatarsal{ self.model.metatarsal.length = metatarsal; }
- (void) setPhalange:(NSInteger)phalange    { self.model.phalange.length = phalange; }

#pragma mark - Setup Notifications

- (void) sendNotifications
{
    // Send accelerometer values using NSNumber instances (compatible with NSDictionary)
    NSNumber *x_device1 = [NSNumber numberWithInteger:self.model.acc1.rotation_x];
    NSNumber *y_device1 = [NSNumber numberWithInteger:self.model.acc1.rotation_y];
    NSNumber *z_device1 = [NSNumber numberWithInteger:self.model.acc1.rotation_z];
    NSNumber *x_device2 = [NSNumber numberWithInteger:self.model.acc2.rotation_x];
    NSNumber *y_device2 = [NSNumber numberWithInteger:self.model.acc2.rotation_y];
    NSNumber *z_device2 = [NSNumber numberWithInteger:self.model.acc2.rotation_z];
    
    NSNumber *x1 = [NSNumber numberWithInteger:self.model.mlx1.x];
    NSNumber *y1 = [NSNumber numberWithInteger:self.model.mlx1.y];
    NSNumber *z1 = [NSNumber numberWithInteger:self.model.mlx1.z];
    
    NSNumber *x2 = [NSNumber numberWithInteger:self.model.mlx2.x];
    NSNumber *y2 = [NSNumber numberWithInteger:self.model.mlx2.y];
    NSNumber *z2 = [NSNumber numberWithInteger:self.model.mlx2.z];
    
    NSNumber *x3 = [NSNumber numberWithInteger:self.model.mlx3.x];
    NSNumber *y3 = [NSNumber numberWithInteger:self.model.mlx3.y];
    NSNumber *z3 = [NSNumber numberWithInteger:self.model.mlx3.z];
    
    NSNumber *x4 = [NSNumber numberWithInteger:self.model.mlx4.x];
    NSNumber *y4 = [NSNumber numberWithInteger:self.model.mlx4.y];
    NSNumber *z4 = [NSNumber numberWithInteger:self.model.mlx4.z];

    NSNumber *x5 = [NSNumber numberWithInteger:self.model.mlx5.x];
    NSNumber *y5 = [NSNumber numberWithInteger:self.model.mlx5.y];
    NSNumber *z5 = [NSNumber numberWithInteger:self.model.mlx5.z];
    
    NSNumber *x6 = [NSNumber numberWithInteger:self.model.mlx6.x];
    NSNumber *y6 = [NSNumber numberWithInteger:self.model.mlx6.y];
    NSNumber *z6 = [NSNumber numberWithInteger:self.model.mlx6.z];
    
    NSNumber *x7 = [NSNumber numberWithInteger:self.model.mlx7.x];
    NSNumber *y7 = [NSNumber numberWithInteger:self.model.mlx7.y];
    NSNumber *z7 = [NSNumber numberWithInteger:self.model.mlx7.z];
    
    NSNumber *x8 = [NSNumber numberWithInteger:self.model.mlx8.x];
    NSNumber *y8 = [NSNumber numberWithInteger:self.model.mlx8.y];
    NSNumber *z8 = [NSNumber numberWithInteger:self.model.mlx8.z];
    
    NSNumber *x9 = [NSNumber numberWithInteger:self.model.mlx9.x];
    NSNumber *y9 = [NSNumber numberWithInteger:self.model.mlx9.y];
    NSNumber *z9 = [NSNumber numberWithInteger:self.model.mlx9.z];
    
    NSNumber *x10 = [NSNumber numberWithInteger:self.model.mlx10.x];
    NSNumber *y10 = [NSNumber numberWithInteger:self.model.mlx10.y];
    NSNumber *z10 = [NSNumber numberWithInteger:self.model.mlx10.z];
    
    NSNumber *x11 = [NSNumber numberWithInteger:self.model.mlx11.x];
    NSNumber *y11 = [NSNumber numberWithInteger:self.model.mlx11.y];
    NSNumber *z11 = [NSNumber numberWithInteger:self.model.mlx11.z];
    
    NSNumber *x12 = [NSNumber numberWithInteger:self.model.mlx12.x];
    NSNumber *y12 = [NSNumber numberWithInteger:self.model.mlx12.y];
    NSNumber *z12 = [NSNumber numberWithInteger:self.model.mlx12.z];
    
    NSNumber *x13 = [NSNumber numberWithInteger:self.model.mlx13.x];
    NSNumber *y13 = [NSNumber numberWithInteger:self.model.mlx13.y];
    NSNumber *z13 = [NSNumber numberWithInteger:self.model.mlx13.z];
    
    NSNumber *x14 = [NSNumber numberWithInteger:self.model.mlx14.x];
    NSNumber *y14 = [NSNumber numberWithInteger:self.model.mlx14.y];
    NSNumber *z14 = [NSNumber numberWithInteger:self.model.mlx14.z];
    
    NSNumber *x15 = [NSNumber numberWithInteger:self.model.mlx15.x];
    NSNumber *y15 = [NSNumber numberWithInteger:self.model.mlx15.y];
    NSNumber *z15 = [NSNumber numberWithInteger:self.model.mlx15.z];
    
    NSNumber *x16 = [NSNumber numberWithInteger:self.model.mlx16.x];
    NSNumber *y16 = [NSNumber numberWithInteger:self.model.mlx16.y];
    NSNumber *z16 = [NSNumber numberWithInteger:self.model.mlx16.z];
    
    // Store keys/values in dictionary property of class.
    self.accelerometerDictionary = @{@"x_1": x_device1,
                                     @"y_1": y_device1,
                                     @"z_1": z_device1,
                                     @"x_2": x_device2,
                                     @"y_2": y_device2,
                                     @"z_2": z_device2};
    
    self.magTrixDictionary = @{@"mlx1_x": x1, @"mlx1_y": y1, @"mlx1_z": z1,
                               @"mlx2_x": x2, @"mlx2_y": y2, @"mlx2_z": z2,
                               @"mlx3_x": x3, @"mlx3_y": y3, @"mlx3_z": z3,
                               @"mlx4_x": x4, @"mlx4_y": y4, @"mlx4_z": z4,
                               @"mlx5_x": x5, @"mlx5_y": y5, @"mlx5_z": z5,
                               @"mlx6_x": x6, @"mlx6_y": y6, @"mlx6_z": z6,
                               @"mlx7_x": x7, @"mlx7_y": y7, @"mlx7_z": z7,
                               @"mlx8_x": x8, @"mlx8_y": y8, @"mlx8_z": z8,
                               @"mlx9_x": x9, @"mlx9_y": y9, @"mlx9_z": z9,
                               @"mlx10_x": x10, @"mlx10_y": y10, @"mlx10_z": z10,
                               @"mlx11_x": x11, @"mlx11_y": y11, @"mlx11_z": z11,
                               @"mlx12_x": x12, @"mlx12_y": y12, @"mlx12_z": z12,
                               @"mlx13_x": x13, @"mlx13_y": y13, @"mlx13_z": z13,
                               @"mlx14_x": x14, @"mlx14_y": y14, @"mlx14_z": z14,
                               @"mlx15_x": x15, @"mlx15_y": y15, @"mlx15_z": z15,
                               @"mlx16_x": x16, @"mlx16_y": y16, @"mlx16_z": z16};
    
    // Create notification centre instance to be used to send data
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // Start posting notifications containing data
    [nc postNotificationName:@"AccelerometerValues"
                      object:self
                    userInfo:self.accelerometerDictionary];
    
    [nc postNotificationName:@"MagTrixValues"
                      object:self
                    userInfo:self.magTrixDictionary];
}

#pragma mark - Updating the GUI
//
- (void) displayData:(NSData *)dataBytes
   forCharacteristic:(CBCharacteristic *)characteristic
{
    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_UART_RX_CHARACTERISTIC]])
    {
        NSString *data = [[NSString alloc] initWithData:characteristic.value
                                               encoding:NSUTF8StringEncoding];
        
        NSInteger test = [data integerValue];
        
        unsigned long dataArray[8];
        
        dataArray[1] = (test & 0xFF00) >> 8;
        dataArray[0] = (test & 0x00FF);
        
        self.yRotationLabel.text = [NSString stringWithFormat:@"0x%lx", test];
        self.xRotationLabel.text = [NSString stringWithFormat:@"0x%lx.%lx", dataArray[1], dataArray[0]];
        
        NSString *temp = [data substringToIndex:4];
        NSInteger value = [temp intValue];
        
//        uint8_t x = value & 0x0F;
//        uint8_t y = (value & 0xF0) >> 8;
        
        //NSLog(@"x: %d, y: %d", x, y);
        
        if (value == 255) {
            self.counter = 0;
        }
        
        if (self.counter == 1) {
            self.model.acc1.rotation_x = (value - 125.0f) * 0.72f;
        } else if (self.counter == 2) {
            self.model.acc1.rotation_y = (value - 125.0f) * 0.72f;
        }
        
        //self.xRotationLabel.text = [NSString stringWithFormat:@"%ld", (long)self.model.acc1.rotation_x];
        //self.yRotationLabel.text = [NSString stringWithFormat:@"%ld", (long)self.model.acc1.rotation_y];
        
        self.counter++;
        if (self.counter > 2) self.counter = 0;
    }
}

- (IBAction)scanSwitchPressed:(UISwitch *)sender {
    
    if (sender.isOn) [self resumeScan];
    else [self pauseScan];
}

- (void) pauseScan
{
    // Scanning uses phone battery, so pause the scan process for the designated interval
    NSLog(@"*** Pausing scan");
    self.statusLabelOne.text = @"Pausing scan...";
    [NSTimer scheduledTimerWithTimeInterval:TIMER_SCAN_INTERVAL
                                     target:self
                                   selector:@selector(resumeScan)
                                   userInfo:nil
                                    repeats:NO];
    
    if (self.connected) self.statusLabelOne.text = [NSString stringWithFormat:@"Connected to: %@", self.peripheral.name];
}

- (void) resumeScan
{
    if (self.scan && self.scanSwitch.isOn)
    {
        // Start scanning again...
        NSLog(@"*** Resuming scan");
        self.statusLabelOne.text = @"Resuming scan...";
        [NSTimer scheduledTimerWithTimeInterval:TIMER_PAUSE_INTERVAL
                                         target:self
                                       selector:@selector(pauseScan)
                                       userInfo:nil
                                        repeats:NO];
        
        [self.centralManager scanForPeripheralsWithServices:nil
                                                    options:nil];
    }
    
    else NSLog(@"*** Scanning turned off");
}
#pragma mark - CBCentralManagerDelegate methods

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    BOOL showAlert = YES;
    NSString *state = @"";
    
    switch ([central state]) {
        case CBManagerStateUnsupported:
            state = @"This device does not support Bluetooth Low Energy";
            break;
            
        case CBManagerStateUnauthorized:
            state = @"This app is not authorized to use Bluetooth Low Energy";
            break;
            
        case CBManagerStatePoweredOff:
            state = @"Bluetooth on this device is currently powered off";
            break;
            
        case CBManagerStateResetting:
            state = @"The BLE manager is resetting; an update is pending";
            break;
            
        case CBManagerStateUnknown:
            state = @"The state of the BLE Manager is unknown";
            break;
            
        case CBManagerStatePoweredOn:
            showAlert = NO;
            state = @"BLE is turned on and ready for communication";
            NSLog(@"%@", state);
            self.scan = YES;
            
            self.statusLabelOne.text = @"Scanning...";
            
            [NSTimer scheduledTimerWithTimeInterval:TIMER_SCAN_INTERVAL
                                             target:self
                                           selector:@selector(pauseScan)
                                           userInfo:nil
                                            repeats:NO];
            
            if (self.scanSwitch.isOn) {
                [self.centralManager scanForPeripheralsWithServices:nil
                                                            options:nil];
            }
            
            break;
            
        default:
            state = @"The state of the BLE Manager is unknown";
            break;
    }
    
    if (showAlert)
    {
        UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"Central Manager State"
                                                                    message:state
                                                             preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
        
        [ac addAction:okAction];
        
        [self presentViewController:ac
                           animated:YES
                         completion:nil];
    }
}

- (void) centralManager:(CBCentralManager *)central
  didDiscoverPeripheral:(CBPeripheral *)peripheral
      advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                   RSSI:(NSNumber *)RSSI
{
    NSString *peripheralName = [advertisementData objectForKey:@"kCBAdvDataLocalName"];
    NSString *peripheralUUID = peripheral.identifier.UUIDString;
    
    if (!self.connected) NSLog(@"Next peripheral: %@ (%@)", peripheralName, peripheralUUID);
    
    if (peripheralName)
    {
        if ([peripheralName isEqualToString:DEVICE_NAME])
        {
            self.scan = NO;
            
            // RSSI - Received Signal Strength Indication
            self.statusLabelTwo.text = [NSString stringWithFormat:@"Signal strength: %.0f", [RSSI floatValue]];
            self.peripheral = peripheral;
            self.peripheral.delegate = self;
            
            [self.centralManager connectPeripheral:peripheral
                                           options:nil];
        }
    }
}


- (void) centralManager:(CBCentralManager *)central
   didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"*** Connected to device");
    self.statusLabelOne.text = [NSString stringWithFormat:@"Connected to: %@", peripheral.name];
    self.connected = YES;
    
    [self.centralManager stopScan];
    
    [peripheral discoverServices:nil];
}


- (void)    centralManager:(CBCentralManager *)central
didFailToConnectPeripheral:(CBPeripheral *)peripheral
                     error:(NSError *)error
{
    self.statusLabelOne.text = @"Failed to connect";
    NSLog(@"*** Failed to connect to device");
    
    self.connected = NO;
    self.scan = YES;
    
    self.statusLabelOne.text = @"Scanning...";
    
    [NSTimer scheduledTimerWithTimeInterval:TIMER_SCAN_INTERVAL
                                     target:self
                                   selector:@selector(pauseScan)
                                   userInfo:nil
                                    repeats:NO];
    
    if (self.scanSwitch.isOn) {
        [self.centralManager scanForPeripheralsWithServices:nil
                                                    options:nil];
    }
}


- (void) centralManager:(CBCentralManager *)central
didDisconnectPeripheral:(CBPeripheral *)peripheral
                  error:(NSError *)error
{
    self.statusLabelTwo.text = [NSString stringWithFormat:@"Disconnected from: %@", peripheral.name];
    self.statusLabelOne.text = @"";
    self.connected = NO;
    
    self.scan = YES;
    
    self.statusLabelOne.text = @"Scanning...";
    
    [NSTimer scheduledTimerWithTimeInterval:TIMER_SCAN_INTERVAL
                                     target:self
                                   selector:@selector(pauseScan)
                                   userInfo:nil
                                    repeats:NO];
    
    if (self.scanSwitch.isOn) {
        [self.centralManager scanForPeripheralsWithServices:nil
                                                    options:nil];
    }
    
    NSLog(@"*** Disconnected from device");
}


#pragma mark - CBPeripheral methods

- (void) peripheral:(CBPeripheral *)peripheral
didDiscoverServices:(NSError *)error
{
    if (error) NSLog(@"Error discovering services: %@", [error localizedDescription]);
    
    for (CBService *service in peripheral.services) {
        NSLog(@"Discovered service: %@", service);
        
        if ([service.UUID isEqual:[CBUUID UUIDWithString:UUID_UART_SERVICE]])
        {
            [peripheral discoverCharacteristics:nil
                                     forService:service];
        }
    }
}


- (void)                    peripheral:(CBPeripheral *)peripheral
  didDiscoverCharacteristicsForService:(CBService *)service
                                 error:(NSError *)error
{
    for (CBCharacteristic *characteristic in service.characteristics) {
    
        NSLog(@"Discovered characteristic: %@", characteristic.description);
        
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_UART_RX_CHARACTERISTIC]])
        {
            [self.peripheral setNotifyValue:YES
                          forCharacteristic:characteristic];
        }
    }
}


- (void)                            peripheral:(CBPeripheral *)peripheral
   didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic
                                         error:(NSError *)error
{
    if (error) NSLog(@"Error changing notification state: %@", [error localizedDescription]);
    if (characteristic.isNotifying) NSLog(@"Notifying started on %@", characteristic);
}


- (void)                peripheral:(CBPeripheral *)peripheral
   didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic
                             error:(NSError *)error
{
    if (error) {
        NSLog(@"Error changing notification state: %@", [error localizedDescription]);
        return;
    }
    
    else if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_UART_RX_CHARACTERISTIC]])
    {
        [self   displayData:characteristic.value
          forCharacteristic:characteristic];
    }
}


@end



