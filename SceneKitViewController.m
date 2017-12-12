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
    
    // Allows the user to control the camera
    self.scnView.allowsCameraControl = YES;
    
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
    
    [[NSRunLoop mainRunLoop] addTimer:motionTimer
                              forMode:NSRunLoopCommonModes];
    
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
    float metatarsalX = [self.model calculateRotation:(self.model.acc1.rotation_x + METATARSAL_X_OFFSET)
                                               onAxis:@"x"
                                              forBone:self.model.metatarsal];
    
    float phalangeX = [self.model calculateRotation:self.model.acc1.rotation_x
                                        onAxis:@"x"
                                       forBone:self.model.phalange];
    
    float calcaneusX = [self.model calculateRotation:self.model.acc1.rotation_x
                                         onAxis:@"x"
                                        forBone:self.model.calcaneus];
    
    //[self.calcaneusNode setRotation:SCNVector4Make(0.0f, 1.0f, 0.0f, self.model.calcaneus.currentYRotation*DEG2RAD)];
    //[self.phalangeNode setRotation:SCNVector4Make(1.0f, 0.0f, 0.0f, self.model.phalange.currentXRotation*DEG2RAD)];
    
    
    [self.metatarsalNode setRotation:SCNVector4Make(1.0f, 0.0f, 0.0f, self.model.acc1.rotation_x*DEG2RAD)];
    
    
    //NSLog(@"metatarsal node rotation: %f", self.metatarsalNode.rotation.x);
}

#pragma mark - Receive Notifications

// This method runs continuously every 100ms on a separate thread
- (void) receiveAccelerometerValues:(NSNotification *)accelerometerDictionary
{
    NSDictionary *accelerometerInfo = accelerometerDictionary.userInfo;
    
    NSNumber *acc1x_value = (NSNumber *)accelerometerInfo[@"x_1"];
    NSNumber *acc1y_value = (NSNumber *)accelerometerInfo[@"y_1"];
    NSNumber *acc1z_value = (NSNumber *)accelerometerInfo[@"z_1"];
    NSNumber *acc2x_value = (NSNumber *)accelerometerInfo[@"x_2"];
    NSNumber *acc2y_value = (NSNumber *)accelerometerInfo[@"y_2"];
    NSNumber *acc2z_value = (NSNumber *)accelerometerInfo[@"z_2"];
    
    self.deviceOneLabel.text = [NSString stringWithFormat:@"Device 1: x: %@, y: %@, z: %@", acc1x_value, acc1y_value, acc1z_value];
    self.deviceTwoLabel.text = [NSString stringWithFormat:@"Device 2: x: %@, y: %@, z: %@", acc2x_value, acc2y_value, acc2z_value];
    
    self.model.acc1.rotation_x = [acc1x_value floatValue] * (-1.0f);
    self.model.acc1.rotation_y = [acc1y_value floatValue];
    self.model.acc1.rotation_z = [acc1z_value floatValue];
    self.model.acc2.rotation_x = [acc2x_value floatValue];
    self.model.acc2.rotation_y = [acc2y_value floatValue];
    self.model.acc2.rotation_z = [acc2z_value floatValue];
}

- (BOOL) shouldAutorotate
{
    return YES;
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (IBAction)calibrateButtonPressed:(UIBarButtonItem *)sender
{
    //NSLog(@"Calibrate button pressed");
    
    self.model.calcaneus.currentXRotation = 0.0f;
    self.model.phalange.currentXRotation = 0.0f;
    self.model.metatarsal.currentXRotation = 0.0f;
    
    self.model.acc1.rotation_x -= self.model.acc1.rotation_x;
    self.model.acc1.rotation_y -= self.model.acc1.rotation_y;
    self.model.acc1.rotation_z -= self.model.acc1.rotation_z;
    self.model.acc2.rotation_x -= self.model.acc2.rotation_x;
    self.model.acc2.rotation_y -= self.model.acc2.rotation_y;
    self.model.acc2.rotation_z -= self.model.acc2.rotation_z;
}


@end
