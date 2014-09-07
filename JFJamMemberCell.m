//
//  JFJamMemberCell.m
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFJamMemberCell.h"

@implementation JFJamMemberCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues

{
 
    NSDictionary *userProfile = [keyedValues objectForKey:@"profile"];
    
    [self.user_pic setImageURL:[NSURL URLWithString:[userProfile objectForKey:@"avatar_url"]]];
    
    NSString *name = [userProfile objectForKey:@"username"];
    NSArray *arrGenres = [keyedValues objectForKey:@"genres"];
    NSArray *arrInstruments = [keyedValues objectForKey:@"instruments"];
    
    self.lblName.text = name;
    
    NSMutableString *genres = [[NSMutableString alloc] init];
    for (NSString *genre in arrGenres)
    {
        [genres appendFormat:@"#%@ ",genre];
    }
    self.lblGenres.text = genres;
    
    NSMutableString *instruments = [[NSMutableString alloc] init];
    for (NSString *instrument in arrInstruments)
    {
        [instruments appendFormat:@"#%@ ",instrument];
    }
}

@end
