//
//  TableViewController.m
//  First BLE App
//
//  Created by Max Houghton on 24/08/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize delegate, userName, gender, age, height, weight, phalangeLength, metatarsalLength, calcaneusLength, fibulaLength, A1Position, A2Position;

#pragma mark - Load Data Methods

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *nameDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *ageDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *genderDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *heightDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *weightDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *A1Default = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *A2Default = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *fibulaDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *calcaneusDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *metatarsalDefault = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *phalangeDefault = [NSUserDefaults standardUserDefaults];
    
    NSString *loadedNameString = [nameDefault objectForKey:@"nameString"];
    NSString *loadedAgeString = [ageDefault objectForKey:@"ageString"];
    NSString *loadedGenderString = [genderDefault objectForKey:@"genderString"];
    NSString *loadedHeightString = [heightDefault objectForKey:@"heightString"];
    NSString *loadedWeightString = [weightDefault objectForKey:@"weightString"];
    NSString *loadedA1String = [A1Default objectForKey:@"A1PositionString"];
    NSString *loadedA2String = [A2Default objectForKey:@"A2PositionString"];
    NSString *loadedFibulaString = [fibulaDefault objectForKey:@"fibulaString"];
    NSString *loadedCalcaneusString = [calcaneusDefault objectForKey:@"calcaneusString"];
    NSString *loadedMetatarsalString = [metatarsalDefault objectForKey:@"metatarsalString"];
    NSString *loadedPhalangeString = [phalangeDefault objectForKey:@"phalangeString"];
    
    [self.nameTextField setText:loadedNameString];
    [self.ageTextField setText:loadedAgeString];
    [self.heightTextField setText:loadedHeightString];
    [self.weightTextField setText:loadedWeightString];
    [self.A1PositionTextField setText:loadedA1String];
    [self.A2PositionTextField setText:loadedA2String];
    [self.fibulaTextField setText:loadedFibulaString];
    [self.calcaneusTextField setText:loadedCalcaneusString];
    [self.metatarsalTextField setText:loadedMetatarsalString];
    [self.phalangeTextField setText:loadedPhalangeString];

    if ([loadedGenderString  isEqualToString:@"0"]) self.genderSegmentControl.selectedSegmentIndex = 0;
    else self.genderSegmentControl.selectedSegmentIndex = 1;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Save Data Methods

- (IBAction)doneButtonPressed:(id)sender {
    
    NSString *nameString = self.nameTextField.text;
    NSString *ageString = self.ageTextField.text;
    NSString *genderString = [NSString stringWithFormat:@"%ld", (long)self.genderSegmentControl.selectedSegmentIndex];
    NSString *heightString = self.heightTextField.text;
    NSString *weightString = self.weightTextField.text;
    NSString *A1PositionString = self.A1PositionTextField.text;
    NSString *A2PositionString = self.A2PositionTextField.text;
    NSString *fibulaString = self.fibulaTextField.text;
    NSString *calcaneusString = self.calcaneusTextField.text;
    NSString *metatarsalString = self.metatarsalTextField.text;
    NSString *phalangeString = self.phalangeTextField.text;
    
    NSUserDefaults *nameDefault = [NSUserDefaults standardUserDefaults];
    [nameDefault setObject:nameString forKey:@"nameString"];
    
    NSUserDefaults *ageDefault = [NSUserDefaults standardUserDefaults];
    [ageDefault setObject:ageString forKey:@"ageString"];
    
    NSUserDefaults *genderDefault = [NSUserDefaults standardUserDefaults];
    [genderDefault setObject:genderString forKey:@"genderString"];
    
    NSUserDefaults *heightDefault = [NSUserDefaults standardUserDefaults];
    [heightDefault setObject:heightString forKey:@"heightString"];
    
    NSUserDefaults *weightDefault = [NSUserDefaults standardUserDefaults];
    [weightDefault setObject:weightString forKey:@"weightString"];
    
    NSUserDefaults *A1Default = [NSUserDefaults standardUserDefaults];
    [A1Default setObject:A1PositionString forKey:@"A1PositionString"];
    
    NSUserDefaults *A2Default = [NSUserDefaults standardUserDefaults];
    [A2Default setObject:A2PositionString forKey:@"A2PositionString"];
    
    NSUserDefaults *fibulaDefault = [NSUserDefaults standardUserDefaults];
    [fibulaDefault setObject:fibulaString forKey:@"fibulaString"];
    
    NSUserDefaults *calcaneusDefault = [NSUserDefaults standardUserDefaults];
    [calcaneusDefault setObject:calcaneusString forKey:@"calcaneusString"];
    
    NSUserDefaults *metatarsalDefault = [NSUserDefaults standardUserDefaults];
    [metatarsalDefault setObject:metatarsalString forKey:@"metatarsalString"];
    
    NSUserDefaults *phalangeDefault = [NSUserDefaults standardUserDefaults];
    [phalangeDefault setObject:phalangeString forKey:@"phalangeString"];

    [nameDefault synchronize];
    [ageDefault synchronize];
    [genderDefault synchronize];
    [heightDefault synchronize];
    [weightDefault synchronize];
    [A1Default synchronize];
    [A2Default synchronize];
    [fibulaDefault synchronize];
    [calcaneusDefault synchronize];
    [metatarsalDefault synchronize];
    [phalangeDefault synchronize];
    
#pragma mark - Send Data to ViewController
    
    userName = nameString;
    
    [[self delegate] setName:nameString];
    [[self delegate] setAge:[ageString floatValue]];
    [[self delegate] setGender:[genderString floatValue]];
    [[self delegate] setHeight:[heightString floatValue]];
    [[self delegate] setWeight:[weightString floatValue]];
    [[self delegate] setA1:[A1PositionString floatValue]];
    [[self delegate] setA2:[A2PositionString floatValue]];
    [[self delegate] setFibula:[fibulaString floatValue]];
    [[self delegate] setCalcaneus:[calcaneusString floatValue]];
    [[self delegate] setMetatarsal:[metatarsalString floatValue]];
    [[self delegate] setPhalange:[phalangeString floatValue]];
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

- (IBAction)clearTableButtonPressed:(id)sender {
    
    self.nameTextField.text = @"";
    self.ageTextField.text = @"";
    self.heightTextField.text = @"";
    self.weightTextField.text = @"";
    
    self.A1PositionTextField.text = @"";
    self.A2PositionTextField.text = @"";
    
    self.fibulaTextField.text = @"";
    self.calcaneusTextField.text = @"";
    self.metatarsalTextField.text = @"";
    self.phalangeTextField.text = @"";
    
    self.genderSegmentControl.selectedSegmentIndex = 0;
}

- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
