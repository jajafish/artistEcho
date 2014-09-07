//
//  JFSignUpLogInVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFSignUpLogInVC.h"

@interface JFSignUpLogInVC ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *pass1Field;
@property (strong, nonatomic) IBOutlet UITextField *pass2Field;

@end

@implementation JFSignUpLogInVC

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

- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    if ([self.pass1Field.text isEqualToString:self.pass2Field.text]) {
        PFUser *thisUser = [PFUser user];
        thisUser.username = self.usernameField.text;
        thisUser.password = self.pass2Field.text;
        thisUser[@"profile"] = self.userProfileDictionary;
        [thisUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            
            NSLog(@"signed up the user");
        }];
    }
    
}

@end
