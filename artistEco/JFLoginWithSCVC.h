//
//  JFLoginWithSCVC.h
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFJamSession.h"

@interface JFLoginWithSCVC : UIViewController

// IF LOGIN WITH SC COMES AT END OF ADD-JAM FLOW
//@property (strong, nonatomic) NSString *jamAddress;
//@property (strong, nonatomic) NSString *jamCity;
//@property (strong, nonatomic) NSDate *jamDate;

@property (strong, nonatomic) JFJamSession *jamSessionInProgress;


@end
