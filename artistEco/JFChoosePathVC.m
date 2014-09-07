//
//  JFChoosePathVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/7/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFChoosePathVC.h"
#import "JFJamsContainerViewController.h"
#import "JFAddJamWhereVC.h"

@interface JFChoosePathVC ()

@end

@implementation JFChoosePathVC

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
- (IBAction)createJamButtonPressed:(UIButton *)sender {
    
    JFAddJamWhereVC *addJamVC = [[JFAddJamWhereVC alloc]init];
    [self presentViewController:addJamVC animated:YES completion:nil];
    
}

- (IBAction)viewJamsButtonPressed:(UIButton *)sender {
    
    JFJamsContainerViewController *viewJamsVC = [[JFJamsContainerViewController alloc]initWithNibName:@"JFMapViewController" bundle:nil];
    [self presentViewController:viewJamsVC animated:YES completion:nil];
    
}

@end
