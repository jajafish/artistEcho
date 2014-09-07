//
//  JFSignUpLogInVC.h
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFJamSession.h"

@interface JFSignUpLogInVC : UIViewController

@property (strong, nonatomic) NSDictionary *userProfileDictionary;
@property (strong, nonatomic) NSString *userSCTrackURI;
@property (strong, nonatomic) NSMutableDictionary *musicianInProgressProfile;
@property (strong, nonatomic) JFJamSession *jamSessionInProgress;

@end
