//
//  JFAddJamWhenVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFAddJamWhenVC.h"
#import "JFLoginWithSCVC.h"

@interface JFAddJamWhenVC ()
@property (strong, nonatomic) IBOutlet UIDatePicker *jamWhenDatePicker;

@end

@implementation JFAddJamWhenVC

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didPressNext:(UIButton *)sender {
    
    JFLoginWithSCVC *scLoginVC = [[JFLoginWithSCVC alloc]init];
    scLoginVC.jamAddress = self.jamAddress;
    scLoginVC.jamCity = self.jamCity;
    scLoginVC.jamDate = self.jamWhenDatePicker.date;
    [self presentViewController:scLoginVC animated:YES completion:nil];
    
}

@end
