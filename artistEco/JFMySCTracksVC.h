//
//  JFMySCTracksVC.h
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface JFMySCTracksVC : UIViewController <AVAudioPlayerDelegate>

@property (strong, nonatomic) NSArray *tracks;
@property (strong, nonatomic) AVAudioPlayer *player;

@end
