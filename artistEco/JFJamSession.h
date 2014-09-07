//
//  JFJamSession.h
//  artistEco
//
//  Created by Jared Fishman on 9/7/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "JFMusician.h"

@interface JFJamSession : PFObject <PFSubclassing>
+(NSString *)parseClassName;

@property (strong, nonatomic) NSString *jamAddress;
@property (strong, nonatomic) NSString *jamCity;
@property (strong, nonatomic) NSDate *jamDate;
@property (strong, nonatomic) JFMusician *idOfJamAdmin;
@property (strong, nonatomic) NSMutableArray *jamAttendees;
@property (strong, nonatomic) NSString *jamDescription;

@end
