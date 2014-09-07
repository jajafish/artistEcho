//
//  JFViewJamsVC.m
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared ;;. All rights reserved.
//

#import "JFViewJamsVC.h"
#import "JFJamMemberCell.h"
#import <AVFoundation/AVFoundation.h>

@interface JFViewJamsVC ()

@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) UIWebView *SCWebView;

@end


@implementation JFViewJamsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [@{@"location":@"123 Fake St.",@"date":@"Aug 23, 2014",@"time":@"5 PM",@"genres":@[@"rock",@"pop"],@"members":@[@{@"name":@"Stephanie"},@{@"name":@"Jared"},@{@"name":@"Paul"}]} mutableCopy];
    
    if (self.data)
    {
        self.lblLocation.text = [self.data objectForKey:@"location"];
        self.lblDate.text = [self.data objectForKey:@"date"];
        self.lblTime.text = [self.data objectForKey:@"time"];
        NSMutableString *txtGenre = [[NSMutableString alloc] init];
        for (NSString * genre in [self.data objectForKey:@"genres"])
        {
            [txtGenre appendFormat:@"%@ ",genre];
        }
        self.lblGenres.text = txtGenre;
    }
    self.arrJamMembers = [self.data objectForKey:@"members"];
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"JFJamMemberCell" bundle:nil] forCellReuseIdentifier:@"jamCell"];
    
    NSLog(@"should be playing song");
    [self playSoundFromSC];
    [self createAndPlaySCFromWebView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrJamMembers count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 326;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JFJamMemberCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jamCell"];
    NSMutableDictionary *member = [self.arrJamMembers objectAtIndex:indexPath.row];
    [cell setValuesForKeysWithDictionary:member];
    return cell;
}

-(void)createAndPlaySCFromWebView
{
    
    self.SCWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.SCWebView.scrollView.scrollEnabled = NO;
    self.SCWebView.scrollView.bounces = NO;
    
    NSString *urlString = @"https://soundcloud.com/jahfish3/shredding";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([data length])[self.SCWebView loadRequest:request];
    }];

    
}

-(void)playSoundFromSC
{

//    NSString *streamURL = @"https://soundcloud.com/jahfish3/shredding";
//    SCAccount *account = [SCSoundCloud account];
//    
//    [SCRequest performMethod:SCRequestMethodGET
//                  onResource:[NSURL URLWithString:streamURL]
//             usingParameters:nil
//                 withAccount:account
//      sendingProgressHandler:nil
//             responseHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                 NSError *playerError;
//                 self.player = [[AVAudioPlayer alloc] initWithData:data error:&playerError];
//                 [self.player prepareToPlay];
//                 [self.player play];
//             }];

    
    NSString *publicTrackUrlString = @"https://soundcloud.com/jahfish3/shredding";
    NSString *urlString = [NSString stringWithFormat:@"%@?client_id=761ee8c9a61ac87e0a47e39ac682b5fa", publicTrackUrlString];
    [SCRequest performMethod:SCRequestMethodGET
                  onResource:[NSURL URLWithString:urlString]
             usingParameters:nil
                 withAccount:nil
      sendingProgressHandler:nil
             responseHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                 NSError *playerError;
                 self.player = [[AVAudioPlayer alloc] initWithData:data error:&playerError];
                 [self.player prepareToPlay];
                 [self.player play];
             }];
    
}

-(IBAction)joinJam
{
    // write parse code to add self to jams table
}

/*-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
}


-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
