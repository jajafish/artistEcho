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
    
    NSLog(@"from local sign up the user profile dictionary is %@", self.musicianInProgressProfile);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(UIButton *)sender {
    
    if ([self.pass1Field.text isEqualToString:self.pass2Field.text]) {
        PFUser *thisUser = [PFUser user];
        thisUser.username = [self.musicianInProgressProfile objectForKey:@"full_name"];
        thisUser.password = @"";
        
        NSURL *url = [NSURL URLWithString:self.userSCTrackURI];
        NSArray *urlComponents = [url pathComponents];
        NSString *trackID = [urlComponents objectAtIndex:2];
        NSLog(@"the song id is %@", trackID);
        
//        [self.musicianInProgressProfile setObject:trackID forKey:@"scTrackID"];
        [self.musicianInProgressProfile setObject:self.userSCTrackURI forKey:@"scTrackID"];
        thisUser[@"profile"] = self.musicianInProgressProfile;
        [thisUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            NSLog(@"signed up the user");
            JFJamSession *jamSessionHosted = [[JFJamSession alloc]init];
            jamSessionHosted = self.jamSessionInProgress;
            [jamSessionHosted addObject:thisUser forKey:@"jamMembers"];
            [jamSessionHosted saveInBackground];
        }];

    }
    
}

@end
