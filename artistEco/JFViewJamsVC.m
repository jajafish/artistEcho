//
//  JFViewJamsVC.m
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared ;;. All rights reserved.
//

#import "JFViewJamsVC.h"
#import "JFJamMemberCell.h"

@interface JFViewJamsVC ()

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
