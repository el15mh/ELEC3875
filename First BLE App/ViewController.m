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
    self.accelerometer_1 = [[Device alloc] init];
    self.accelerometer_2 = [[Device alloc] init];
    
    [self.model initModel];
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self
                                                               queue:nil
                                                             options:nil];
    
    // Initialize all values to 0
    self.accelerometer_1.rotation_x = 0;
    self.accelerometer_1.rotation_y = 0;
    self.accelerometer_1.rotation_z = 0;
    
    self.accelerometer_2.rotation_x = 0;
    self.accelerometer_2.rotation_y = 0;
    self.accelerometer_2.rotation_z = 0;
    
    self.model.phalange.length = 0;
    self.model.metatarsal.length = 0;
    self.model.calcaneus.length = 0;
    self.model.fibula.length = 0;
    
    self.model.device1.position= 0;
    self.model.device2.position = 0;
    
    self.model.device1.rotation_x = self.accelerometer_1.rotation_x;
    self.model.device1.rotation_y = self.accelerometer_1.rotation_y;
    self.model.device1.rotation_z = self.accelerometer_1.rotation_z;
    
    self.model.device2.rotation_x = self.accelerometer_2.rotation_x;
    self.model.device2.rotation_y = self.accelerometer_2.rotation_y;
    self.model.device2.rotation_z = self.accelerometer_2.rotation_z;
    
    self.userNameLabel.text = [NSString stringWithFormat:@"Name: %@", self.model.userName];
    self.ageLabel.text = [NSString stringWithFormat:@"Age: %ld", (long)self.model.age];
    
    if (self.model.gender == MALE) self.sexLabel.text = @"Gender: Male";
    else self.sexLabel.text = @"Gender: Female";
    
    self.heightLabel.text = [NSString stringWithFormat:@"Height: %ld", (long)self.model.height];
    self.weightLabel.text = [NSString stringWithFormat:@"Weight: %ld", (long)self.model.weight];
    
    self.statusLabel.text = @"Searching...";
    self.connected = false;
    
    NSTimer *valuesTimer = [NSTimer timerWithTimeInterval:UPDATE_VALUES_INTERVAL
                                                   target:self
                                                 selector:@selector(sendAccelerometerValues)
                                                 userInfo:nil
                                                  repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:valuesTimer
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
    
    self.heightLabel.text = [NSString stringWithFormat:@"Height: %ld", (long)self.model.height];
    self.weightLabel.text = [NSString stringWithFormat:@"Weight: %ld", (long)self.model.weight];
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

- (void) setName:(NSString *)name
{
    self.model.userName = name;
}

- (void) setAge:(NSInteger)age
{
    self.model.age = age;
}

- (void) setGender:(NSInteger)gender
{
    self.model.gender = gender;
}

- (void) setHeight:(NSInteger)height
{
    self.model.height = height;
}

- (void) setWeight:(NSInteger)weight
{
    self.model.weight = weight;
}

- (void) setA1:(NSInteger)A1Position
{
    self.model.device1.position = A1Position;
}

- (void) setA2:(NSInteger)A2Position
{
    self.model.device2.position = A2Position;
}

- (void) setFibula:(NSInteger)fibula
{
    self.model.fibula.length = fibula;
}

- (void) setCalcaneus:(NSInteger)calcaneus
{
    self.model.calcaneus.length = calcaneus;
}

- (void) setMetatarsal:(NSInteger)metatarsal
{
    self.model.metatarsal.length = metatarsal;
}

- (void) setPhalange:(NSInteger)phalange
{
    self.model.phalange.length = phalange;
}

#pragma mark - Setup Notifications

- (void) sendAccelerometerValues
{
    // Send accelerometer values using NSNumber instances (compatible with NSDictionary)
    NSNumber *x_device1 = [NSNumber numberWithInteger:self.model.device1.rotation_x];
    NSNumber *y_device1 = [NSNumber numberWithInteger:self.model.device1.rotation_y];
    NSNumber *z_device1 = [NSNumber numberWithInteger:self.model.device1.rotation_z];
    NSNumber *x_device2 = [NSNumber numberWithInteger:self.model.device2.rotation_x];
    NSNumber *y_device2 = [NSNumber numberWithInteger:self.model.device2.rotation_y];
    NSNumber *z_device2 = [NSNumber numberWithInteger:self.model.device2.rotation_z];

    // Store keys/values in dictionary property of class.
    self.accelerometerDictionary = @{@"x_1": x_device1,
                                     @"y_1": y_device1,
                                     @"z_1": z_device1,
                                     @"x_2": x_device2,
                                     @"y_2": y_device2,
                                     @"z_2": z_device2};
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    //NSLog(@"sending dictionary: %@", self.accelerometerDictionary);
    
    [nc postNotificationName:@"AccelerometerValues"
                      object:self
                    userInfo:self.accelerometerDictionary];
    
}

#pragma mark - Updating the GUI
//
- (void) displayData:(NSData *)dataBytes
{
    NSUInteger length = dataBytes.length;
    uint32_t dataArray[length];
    
    //NSLog(@"%@", dataBytes);
    
    for (int i = 0; i < length; i++) dataArray[i] = 0;
    
    [dataBytes getBytes:&dataArray
                 length:length * sizeof(uint16_t)];
    
    uint32_t rawData = dataArray[1] + dataArray[0];
    
    double data = (double)rawData / 25600;
    
    data -= 90;

    self.xRotationLabel.text = [NSString stringWithFormat:@"X Axis: %f", data];
    self.model.device1.rotation_x = data;
    
    //NSLog(@"%x", *dataArray);
    //NSLog(@"data = %i", (int)data);
}


#pragma mark - CBCentralManagerDelegate methods

- (void) centralManagerDidUpdateState:(CBCentralManager *)central
{
    BOOL showAlert = YES;
    NSString *state = @"";
    
    switch ([self.centralManager state]) {
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
            
            [self.centralManager scanForPeripheralsWithServices:nil options:nil];
            
            break;
          
        /*
        default:
            state = @"The state of the BLE Manager is unknown";
            break;
         */
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
            
            NSLog(@"Peripheral: %@", peripheralName);
            
            self.peripheral = peripheral;
            self.peripheral.delegate = self;
            
            [self.centralManager connectPeripheral:self.peripheral
                                           options:nil];
        }
    }
}


- (void) centralManager:(CBCentralManager *)central
   didConnectPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"*** Connected to device");
    self.statusLabel.text = [NSString stringWithFormat:@"Connected to: %@", peripheral.name];
    self.connected = true;
    
    [central stopScan];
    [peripheral discoverServices:nil];
}


- (void)    centralManager:(CBCentralManager *)central
didFailToConnectPeripheral:(CBPeripheral *)peripheral
                     error:(NSError *)error
{
    self.statusLabel.text = @"Failed to connect";
    NSLog(@"*** Failed to connect to device");
    
    self.connected = false;

    [central scanForPeripheralsWithServices:nil options:nil];
}


- (void) centralManager:(CBCentralManager *)central
didDisconnectPeripheral:(CBPeripheral *)peripheral
                  error:(NSError *)error
{
    self.statusLabel.text = [NSString stringWithFormat:@"Disconnected from: %@", peripheral.name];
    self.connected = false;
    
    NSLog(@"*** Disconnected from device");
}


#pragma mark - CBPeripheral methods

- (void) peripheral:(CBPeripheral *)peripheral
didDiscoverServices:(NSError *)error
{
    for (CBService *service in peripheral.services) {
        NSLog(@"Discovered service: %@", service);
        
        if ([service.UUID isEqual:[CBUUID UUIDWithString:UUID_HEALTH_THERMOMETER_SERVICE]])
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
        //uint8_t enableValue = 1;
        //        NSData *enableBytes = [NSData dataWithBytes:&enableValue
        //                                             length:sizeof(uint8_t)];
        
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_TEMPERATURE_CHARACTERISTIC]])
        {
            [self.peripheral setNotifyValue:YES
                          forCharacteristic:characteristic];
            
            NSLog(@"Discovered characteristic: %@", characteristic.description);
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
    
    else {
        if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:UUID_TEMPERATURE_CHARACTERISTIC]])
        {
            [self displayData:characteristic.value];
        }
    }
}


@end



