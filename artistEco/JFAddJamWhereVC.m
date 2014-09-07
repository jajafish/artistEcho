//
//  JFAddJamWhereVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFAddJamWhereVC.h"
#import "JFAddJamWhenVC.h"

@interface JFAddJamWhereVC ()
@property (strong, nonatomic) IBOutlet UITextField *jamAddressTextField;
@property (strong, nonatomic) IBOutlet UITextField *jamCityTextField;

@end

@implementation JFAddJamWhereVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.jamAddressTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didPressNextButton:(UIButton *)sender {
    JFAddJamWhenVC *whenVC = [[JFAddJamWhenVC alloc]init];
    whenVC.jamAddress = self.jamAddressTextField.text;
    whenVC.jamCity = self.jamCityTextField.text;
    [self presentViewController:whenVC animated:YES completion:nil];
    
}

@end
