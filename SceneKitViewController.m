//
//  SceneKitViewController.m
//  First BLE App
//
//  Created by Max Houghton on 31/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SceneKitViewController.h"

@interface SceneKitViewController ()

@end

@implementation SceneKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Create model to be used for data
    self.model = [[DataModel alloc] init];
    [self.model initModel];
    
#pragma mark - Setup Scene
    
    // Load scene from assets into program
    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/footmodel.dae"];
    
    // Create a camera and add to scene
    self.cameraNode = [SCNNode node];
    self.cameraNode.camera = [SCNCamera camera];
    //self.cameraNode.camera.usesOrthographicProjection = YES;
    [scene.rootNode addChildNode:self.cameraNode];
    
    // Place camera
    self.cameraNode.position = SCNVector3Make(0, 10, 35);
    
    // Create light node and add to scene
    SCNNode *lightNode = [SCNNode node];
    lightNode.light = [SCNLight light];
    lightNode.light.type = SCNLightTypeOmni;
    lightNode.position = SCNVector3Make(0, 10, 30);
    //[scene.rootNode addChildNode:lightNode];
    
    // Create an ambient light node
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    ambientLightNode.position = SCNVector3Make(0, 30, 30);
    //[scene.rootNode addChildNode:ambientLightNode];
    
    // Create a backlight node
    SCNNode *backlight = [SCNNode node];
    backlight.light = [SCNLight light];
    backlight.light.type = SCNLightTypeAmbient;
    backlight.light.color = [UIColor darkGrayColor];
    backlight.position = SCNVector3Make(0, -30, -30);
    //[scene.rootNode addChildNode:backlight];
    
    // Configure the background
    self.scnView.backgroundColor = [UIColor whiteColor];
    
    // Allows the user to control the camera
    self.scnView.allowsCameraControl = YES;
    
    // Retrieve the SCNView and add the scene to the view
    self.scnView.scene = scene;
    //self.scnView.showsStatistics = YES;
    
#pragma mark - Retrieve model nodes and start motion
        
    // Retrieve the nodes
    self.armatureNode =     [scene.rootNode childNodeWithName:@"Armature" recursively:NO];
    self.fibulaNode =       [self.armatureNode childNodeWithName:@"Fibula" recursively:NO];
    self.navicularNode =    [self.fibulaNode childNodeWithName:@"Navicular" recursively:NO];
    self.calcaneusNode =    [self.fibulaNode childNodeWithName:@"Calcaneus" recursively:NO];
    self.metatarsalNode =   [self.navicularNode childNodeWithName:@"Metatarsal" recursively:NO];
    self.phalangeNode =     [self.metatarsalNode childNodeWithName:@"Phalange" recursively:NO];
    
    // Create a timer to add to the main thread which updates the position of the nodes every 10ms
    NSTimer *motionTimer = [NSTimer timerWithTimeInterval:UPDATE_VALUES_INTERVAL
                                                   target:self
                                                 selector:@selector(updateModelPosition)
                                                 userInfo:nil
                                                  repeats:YES];
    
    self.model.metatarsal.nominalXRotation = self.metatarsalNode.rotation.x;
    NSLog(@"Nominal navicular x rotation: %ld", (long)self.navicularNode.rotation.x);
    NSLog(@"Nominal navicular y rotation: %ld", (long)self.navicularNode.rotation.y);
    NSLog(@"Nominal navicular z rotation: %ld", (long)self.navicularNode.rotation.z);
    NSLog(@"Nominal metatarsal x rotation: %ld", (long)self.navicularNode.rotation.x);
    NSLog(@"Nominal metatarsal y rotation: %ld", (long)self.navicularNode.rotation.y);
    NSLog(@"Nominal metatarsal z rotation: %ld", (long)self.navicularNode.rotation.z);

    [[NSRunLoop mainRunLoop] addTimer:motionTimer
                              forMode:NSRunLoopCommonModes];
    
    
    
    self.ticker = 1;

    
#pragma mark - Receive Notifications
    
    // Add method to subscribe to the notifications being broadcast from the ViewController class in the separate tab
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveAccelerometerValues:)
                                                 name:@"AccelerometerValues"
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateModelPosition
{
    // Using constraints (obtained arbitrarily from 3D model) to give rough limits to bone rotation
    self.model.calcaneus.currentXRotation = [self.model.calcaneus setMaximumRotation:90
                                                                  setMinimumRotation:-90
                                                                  forCurrentRotation:self.model.device1.rotation_x];
    
    self.model.phalange.currentXRotation = [self.model.phalange setMaximumRotation:MAXIMUM_PHALANGE_X_ROTATION
                                                                setMinimumRotation:MINIMUM_PHALANGE_X_ROTATION
                                                                forCurrentRotation:self.model.device1.rotation_x];
    
    self.model.metatarsal.currentXRotation = [self.model.metatarsal setMaximumRotation:MAXIMUM_METATARSAL_X_ROTATION
                                                                    setMinimumRotation:MINIMUM_METATARSAL_X_ROTATION
                                                                    forCurrentRotation:self.model.device1.rotation_x];
    
    [self.calcaneusNode setRotation:SCNVector4Make(1.0f, 0.0f, 0.0f, self.model.calcaneus.currentXRotation*DEG2RAD*(-1))];
    [self.phalangeNode setRotation:SCNVector4Make(1.0f, 0.0f, 0.0f, self.model.phalange.currentXRotation*DEG2RAD)];
    [self.metatarsalNode setRotation:SCNVector4Make(1.0f, 0.0f, 0.0f, self.model.metatarsal.currentXRotation*DEG2RAD)];
}

#pragma mark - Receive Notifications

// This method runs continuously every 100ms on a separate thread
- (void) receiveAccelerometerValues:(NSNotification *)accelerometerDictionary
{
    NSDictionary *accelerometerInfo = accelerometerDictionary.userInfo;
    
    NSNumber *x1_value = (NSNumber *)accelerometerInfo[@"x_1"];
    NSNumber *y1_value = (NSNumber *)accelerometerInfo[@"y_1"];
    NSNumber *z1_value = (NSNumber *)accelerometerInfo[@"z_1"];
    NSNumber *x2_value = (NSNumber *)accelerometerInfo[@"x_2"];
    NSNumber *y2_value = (NSNumber *)accelerometerInfo[@"y_2"];
    NSNumber *z2_value = (NSNumber *)accelerometerInfo[@"z_2"];
    
    self.deviceOneLabel.text = [NSString stringWithFormat:@"Device 1: x: %@, y: %@, z: %@", x1_value, y1_value, z1_value];
    self.deviceTwoLabel.text = [NSString stringWithFormat:@"Device 2: x: %@, y: %@, z: %@", x2_value, y2_value, z2_value];
    
    self.model.device1.rotation_x = [x1_value floatValue];
    self.model.device1.rotation_y = [y1_value floatValue];
    self.model.device1.rotation_z = [z1_value floatValue];
    self.model.device2.rotation_x = [x2_value floatValue];
    self.model.device2.rotation_y = [y2_value floatValue];
    self.model.device2.rotation_z = [z2_value floatValue];
    
    //NSLog(@"float test: %ld", (long)self.model.device1.rotation_x);
    //NSLog(@"received dictionary: %@", accelerometerInfo);
    
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (IBAction)calibrateButtonPressed:(UIBarButtonItem *)sender {
    
    NSLog(@"Calibrate button pressed");
}


@end
