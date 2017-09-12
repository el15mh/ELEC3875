//
//  TableViewController.h
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

#import "DataModel.h"

@protocol passData <NSObject>

- (void) setName:(NSString *)userName;
- (void) setAge:(NSInteger)age;
- (void) setGender:(NSInteger)gender;
- (void) setHeight:(NSInteger)height;
- (void) setWeight:(NSInteger)weight;

- (void) setA1:(NSInteger)A1Position;
- (void) setA2:(NSInteger)A2Position;
- (void) setFibula:(NSInteger)fibula;
- (void) setCalcaneus:(NSInteger)calcaneus;
- (void) setMetatarsal:(NSInteger)metatarsal;
- (void) setPhalange:(NSInteger)phalange;

@end

@interface TableViewController : UITableViewController

@property (retain)id <passData> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegmentControl;
@property (weak, nonatomic) IBOutlet UITextField *heightTextField;
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;

@property (weak, nonatomic) IBOutlet UITextField *A1PositionTextField;
@property (weak, nonatomic) IBOutlet UITextField *A2PositionTextField;

@property (weak, nonatomic) IBOutlet UITextField *fibulaTextField;
@property (weak, nonatomic) IBOutlet UITextField *calcaneusTextField;
@property (weak, nonatomic) IBOutlet UITextField *metatarsalTextField;
@property (weak, nonatomic) IBOutlet UITextField *phalangeTextField;

@property (strong, nonnull) NSString *userName;

@property NSInteger gender;
@property NSInteger age;
@property NSInteger height;
@property NSInteger weight;

@property NSInteger phalangeLength;
@property NSInteger metatarsalLength;
@property NSInteger calcaneusLength;
@property NSInteger fibulaLength;

@property NSInteger A1Position;         // Distance from A1 to ankle
@property NSInteger A2Position;         // Distance from ankle to A2

@property (nonatomic, assign) BOOL load;

- (IBAction)doneButtonPressed:(UIBarButtonItem *_Nullable)sender;
- (IBAction)clearTableButtonPressed:(UIBarButtonItem *_Nullable)sender;
- (IBAction)cancelButtonPressed:(UIBarButtonItem *_Nullable)sender;


@end
