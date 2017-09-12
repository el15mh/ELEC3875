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
    self.model = [[DataModel alloc] init];
    
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
    [scene.rootNode addChildNode:lightNode];
    
    // Create an ambient light node
    SCNNode *ambientLightNode = [SCNNode node];
    ambientLightNode.light = [SCNLight light];
    ambientLightNode.light.type = SCNLightTypeAmbient;
    ambientLightNode.light.color = [UIColor darkGrayColor];
    ambientLightNode.position = SCNVector3Make(0, 30, 30);
    [scene.rootNode addChildNode:ambientLightNode];
    
    SCNNode *backlight = [SCNNode node];
    backlight.light = [SCNLight light];
    backlight.light.type = SCNLightTypeAmbient;
    backlight.light.color = [UIColor darkGrayColor];
    backlight.position = SCNVector3Make(0, -30, -30);
    [scene.rootNode addChildNode:backlight];
    
    // Configure the background
    self.scnView.backgroundColor = [UIColor whiteColor];
    
    // Allows the user to control the camera
    self.scnView.allowsCameraControl = YES;
    
    // Retrieve the SCNView and add the scene to the view
    self.scnView.scene = scene;
    //self.scnView.showsStatistics = YES;
    
#pragma mark - Retrieve model nodes and setup motion
        
    // Retrieve the nodes
    SCNNode *Armature =     [scene.rootNode childNodeWithName:@"Armature" recursively:NO];
    SCNNode *Fibula =       [Armature childNodeWithName:@"Fibula" recursively:NO];
    SCNNode *Navicular =    [Fibula childNodeWithName:@"Navicular" recursively:NO];
    SCNNode *Calcaneus =    [Fibula childNodeWithName:@"Calcaneus" recursively:NO];
    SCNNode *Metatarsal =   [Navicular childNodeWithName:@"Metatarsal" recursively:NO];
    SCNNode *Phalange =     [Metatarsal childNodeWithName:@"Phalange" recursively:NO];

    SCNVector3 axis;
    
    axis.x = 1;
    axis.y = 1;
    axis.z = 0;
    
    //[Armature runAction:[SCNAction rotateByAngle:45 aroundAxis:axis duration:10.0f]]
    //[Phalange runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:1 z:0 duration:1]]];
    [Metatarsal runAction:[SCNAction repeatActionForever:[SCNAction rotateByX:0 y:1 z:0 duration:1]]];
    
//    for (SCNNode *node in Armature.childNodes){
//        NSLog(@"node = %@", node.name);
//    }
    
#pragma mark - Setup Notifications
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(receiveAccelerometerValues:)
                                                 name:@"AccelerometerValues"
                                               object:nil];
}

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
    
    self.model.rotationA1_x = [x1_value floatValue];
    self.model.rotationA1_y = [y1_value floatValue];
    self.model.rotationA1_z = [z1_value floatValue];
    self.model.rotationA2_x = [x2_value floatValue];
    self.model.rotationA2_y = [y2_value floatValue];
    self.model.rotationA2_z = [z2_value floatValue];
    
    //NSLog(@"float test: %ld", (long)self.model.rotationA1_x);
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
