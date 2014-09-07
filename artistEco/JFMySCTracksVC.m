//
//  JFMySCTracksVC.m
//  artistEco
//
//  Created by Jared Fishman on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFMySCTracksVC.h"
#import <UIKit/UIKit.h>

@interface JFMySCTracksVC () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *myTracksTableView;

@end

@implementation JFMySCTracksVC

@synthesize tracks, player;

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
    self.myTracksTableView.delegate = self;
    self.myTracksTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.tracks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *track = [self.tracks objectAtIndex:indexPath.row];
    cell.textLabel.text = [track objectForKey:@"title"];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *track = [self.tracks objectAtIndex:indexPath.row];
    NSString *streamURL = [track objectForKey:@"stream_url"];
    
//    SCAccount *account = [SCSoundCloud account];
//    
//    [SCRequest performMethod:SCRequestMethodGET
//                  onResource:[NSURL URLWithString:streamURL]
//             usingParameters:nil
//                 withAccount:account
//      sendingProgressHandler:nil
//             responseHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                 NSError *playerError;
//                 player = [[AVAudioPlayer alloc] initWithData:data error:&playerError];
//                 [player prepareToPlay];
//                 [player play];
//             }];
    
    
    
}

@end
