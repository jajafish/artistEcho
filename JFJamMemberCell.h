//
//  JFJamMemberCell.h
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h" 
#import <AVFoundation/AVFoundation.h>

@interface JFJamMemberCell : UITableViewCell <AVAudioPlayerDelegate>

@property IBOutlet UIImageView *user_pic; 
@property IBOutlet UILabel *lblName, *lblGenres, *lblInstruments;

@property (strong, nonatomic) NSDictionary *musicianProfile;

@property (strong, nonatomic) AVAudioPlayer *player;
//@property (strong, nonatomic) AVPlayer *player;

@end
