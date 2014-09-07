//
//  JFSignUpLogInVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFSignUpLogInVC.h"
#import "JFJamSession.h"

@interface JFSignUpLogInVC ()
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *pass1Field;
@property (strong, nonatomic) IBOutlet UITextField *pass2Field;
@property (strong, nonatomic) JFJamSession *jamSessionToUpload;
@property (strong, nonatomic) JFMusician *musicianToUpload;

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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(jamSessionToAdd:) name:@"jamSessionInProgressNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(musicianToAdd:) name:@"musicianInProgressNotification" object:nil];
    
    NSLog(@"the user profile dictionary is %@", self.userProfileDictionary);
    
}

-(void)musicianToAdd: (NSNotification*)notif {
    
    NSLog(@"on login page, should add musician from notif center");
    
    self.musicianToUpload = (JFMusician *)[[notif userInfo]valueForKey:@"theMusicianBeingMade"];
    
    NSLog(@"on the signup page and the musician info is %@", self.musicianToUpload);
    
}

-(void)jamSessionToAdd:(NSNotification*)notif {
    
    NSLog(@"on the login page, should soon add the jam session from notif center");
    self.jamSessionToUpload = (JFJamSession *)[[notif userInfo] valueForKey:@"theJamSessionBeingMade"];
    NSLog(@"on the signup page and the jam session info is %@", self.jamSessionToUpload);
    
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
