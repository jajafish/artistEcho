//
//  JFMusician.h
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <Parse/Parse.h>

@interface JFMusician : PFUser <PFSubclassing>

@property (strong, nonatomic) NSDictionary *musicianProfileDictionary;
@property (strong, nonatomic) NSString *musicianName;
@property (strong, nonatomic) NSString *musicianSoundCloudID;
@property (strong, nonatomic) NSString *musicianSongLink;
@property (strong, nonatomic) NSString *musicianImageLink;
@property (strong, nonatomic) NSMutableArray *musicianGenres;
@property (strong, nonatomic) NSMutableArray *musicianInstruments;

@end
