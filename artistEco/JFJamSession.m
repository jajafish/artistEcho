//
//  JFJamSession.m
//  artistEco
//
//  Created by Jared Fishman on 9/7/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFJamSession.h"
#import <Parse/PFSubclassing.h>

@implementation JFJamSession

@dynamic jamDate, jamCity, jamAddress, jamAttendees, jamDescription, idOfJamAdmin;

+(NSString *)parseClassName
{
    return @"JFJamSession";
}


@end
