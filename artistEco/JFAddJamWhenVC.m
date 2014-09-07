//
//  JFAddJamWhenVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFAddJamWhenVC.h"
#import "JFLoginWithSCVC.h"
#import "JFMySCTracksVC.h"

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
//    [self presentViewController:scLoginVC animated:YES completion:nil];
    
    
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

-(void)viewDidAppear:(BOOL)animated
{
    if ([SCSoundCloud account]){
        [self presentSCTrackListing];
    }
}

-(void)askForUserTrackSelection
{
    
    
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
    
}

-(void)collectSCUserData
{
    
    NSLog(@"should be displaying profile info --------");
    
    SCAccount *account = [SCSoundCloud account];
    
    SCRequestResponseHandler handler;
    handler = ^(NSURLResponse *response, NSData *data, NSError *error){
        NSError *jsonError = nil;
        NSJSONSerialization *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        
        
        NSDictionary *scResponse = [[NSDictionary alloc]init];
        scResponse = (NSDictionary *)jsonResponse;
        
        NSMutableDictionary *userProfile = [[NSMutableDictionary alloc]init];
        
        if (scResponse[@"id"]){
            userProfile[@"id"] = scResponse[@"id"];
        }
        if (scResponse[@"full_name"]){
            userProfile[@"full_name"] = scResponse[@"full_name"];
        }
        if (scResponse[@"username"]){
            userProfile[@"username"] = scResponse[@"username"];
        }
        if (scResponse[@"avatar_url"]){
            userProfile[@"avatar_url"] = scResponse[@"avatar_url"];
        }
        if (scResponse[@"city"]){
            userProfile[@"city"] = scResponse[@"city"];
        }
        if (scResponse[@"country"]){
            userProfile[@"country"] = scResponse[@"country"];
        }
        if (scResponse[@"permalink"]){
            userProfile[@"permalink"] = scResponse[@"permalink"];
        }
        if (scResponse[@"uri"]){
            userProfile[@"uri"] = scResponse[@"uri"];
        }
        
        //        NSLog(@"the saved profile is %@", userProfile);
        
//        JFSignUpLogInVC *signUpVC = [[JFSignUpLogInVC alloc]init];
//        signUpVC.userProfileDictionary = userProfile;
//        [self presentViewController:signUpVC animated:YES completion:nil];
        
        //        PFObject *musician = [PFObject objectWithClassName:@"musician"];
        //        [musician setObject:userProfile forKey:@"userProfile"];
        //        [musician saveInBackground];
        
    };
    
    NSString *resourceURL = @"https://api.soundcloud.com/me.json";
    [SCRequest performMethod:SCRequestMethodGET onResource:[NSURL URLWithString:resourceURL] usingParameters:nil withAccount:account sendingProgressHandler:nil responseHandler:handler];
    
}

-(void)presentSCTrackListing
{
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
}

@end
