//
//  JFLoginWithSCVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFLoginWithSCVC.h"
#import "JFMySCTracksVC.h"
#import <Parse/Parse.h>

@interface JFLoginWithSCVC ()

@property (strong, nonatomic) NSDictionary *scProfile;

@end

@implementation JFLoginWithSCVC

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

- (IBAction)didPressLoginButton:(UIButton *)sender {
    
    SCLoginViewControllerCompletionHandler handler = ^(NSError *error) {
        if (SC_CANCELED(error)) {
            NSLog(@"Canceled!");
        } else if (error) {
            NSLog(@"Error: %@", [error localizedDescription]);
        } else {
            NSLog(@"Done!");
        }
    };
    
    [SCSoundCloud requestAccessWithPreparedAuthorizationURLHandler:^(NSURL *preparedURL) {
        SCLoginViewController *loginViewController;
        
        loginViewController = [SCLoginViewController
                               loginViewControllerWithPreparedURL:preparedURL
                               completionHandler:handler];
        [self presentModalViewController:loginViewController animated:YES];
    }];
    
}

- (IBAction)getSCTracks:(UIButton *)sender {
    
    SCAccount *account = [SCSoundCloud account];
    if (account == nil) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Not Logged In"
                              message:@"You must login first"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    SCRequestResponseHandler handler;
    handler = ^(NSURLResponse *response, NSData *data, NSError *error) {
        NSError *jsonError = nil;
        NSJSONSerialization *jsonResponse = [NSJSONSerialization
                                             JSONObjectWithData:data
                                             options:0
                                             error:&jsonError];
        if (!jsonError && [jsonResponse isKindOfClass:[NSArray class]]) {
            JFMySCTracksVC *trackListVC;
            trackListVC = [[JFMySCTracksVC alloc]
                           initWithNibName:@"JFMySCTracksVC"
                           bundle:nil];
            trackListVC.tracks = (NSArray *)jsonResponse;
            [self presentViewController:trackListVC
                               animated:YES completion:nil];
        }
    };
    
    NSString *resourceURL = @"https://api.soundcloud.com/me/tracks.json";
    [SCRequest performMethod:SCRequestMethodGET
                  onResource:[NSURL URLWithString:resourceURL]
             usingParameters:nil
                 withAccount:account
      sendingProgressHandler:nil
             responseHandler:handler];
    
    
    
    [self getUserInfo];
    
    PFObject *testObject = [PFObject objectWithClassName:@"User"];
    testObject[@"soundcloudsong"] = @"shreddin";
    [testObject saveInBackground];
    
}

-(void)getUserInfo
{
    
    NSLog(@"should be displaying profile info --------");
    
    SCAccount *account = [SCSoundCloud account];
    
    SCRequestResponseHandler handler;
    handler = ^(NSURLResponse *response, NSData *data, NSError *error){
        NSError *jsonError = nil;
        NSJSONSerialization *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

            
            self.scProfile = [[NSDictionary alloc]init];
            self.scProfile = (NSDictionary *)jsonResponse;
            NSLog(@"here is the profile: %@", self.scProfile);
            
//
//            NSLog(@"%@", response);
//            NSLog(@"%@", jsonResponse);

    };
    
    NSString *resourceURL = @"https://api.soundcloud.com/me.json";
    [SCRequest performMethod:SCRequestMethodGET onResource:[NSURL URLWithString:resourceURL] usingParameters:nil withAccount:account sendingProgressHandler:nil responseHandler:handler];
    
    
}

//-(void)saveSCInfoToParseUser
//{
//    
////    NSDictionary *soundcloudResults = (NSDictionary *)
//    
//}

@end
