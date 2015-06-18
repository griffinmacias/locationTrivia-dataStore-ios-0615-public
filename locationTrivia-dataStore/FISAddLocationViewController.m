//
//  FISAddLocationViewController.m
//  locationTrivia-dataStore
//
//  Created by Mason Macias on 6/18/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISAddLocationViewController.h"
#import "FISLocationsDataManager.h"
#import "FISLocation.h"
@interface FISAddLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@end

@implementation FISAddLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataManager = [FISLocationsDataManager sharedLocationsDataManager];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButtonTapped:(id)sender
{
    NSNumberFormatter *stringToNumber = [[NSNumberFormatter alloc] init];
    stringToNumber.numberStyle = NSNumberFormatterDecimalStyle;
    
    NSNumber *longitude = [stringToNumber numberFromString:self.longitudeTextField.text];
    NSNumber *latitude = [stringToNumber numberFromString:self.latitudeTextField.text];
    
    FISLocation *location = [[FISLocation alloc] initWithName:self.nameTextField.text latitude:longitude longitude:latitude];
    [self.dataManager.locations addObject:location];

    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
