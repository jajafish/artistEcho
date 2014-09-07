//
//  JFJamMemberCell.h
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h" 

@interface JFJamMemberCell : UITableViewCell

@property IBOutlet UIImageView *user_pic; 
@property IBOutlet UILabel *lblName, *lblGenres, *lblInstruments; 

@end
