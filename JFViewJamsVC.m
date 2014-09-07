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
    
    if (self.jamData)
    {
//        
//        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
//        NSString *stringFromDate = [formatter stringFromDate:<#(NSDate *)#>]
//        
        
        NSString *dateString = [NSDateFormatter localizedStringFromDate:[self.jamData objectForKey:@"jamDate"]
                                                              dateStyle:NSDateFormatterShortStyle
                                                              timeStyle:NSDateFormatterFullStyle];
        
        NSLog(@"the date for this jame is %@", dateString);
        
        self.lblLocation.text = [self.jamData objectForKey:@"jamAddress"];
        self.lblDate.text = dateString;
//        self.lblTime.text = [self.jamData objectForKey:@"time"];
//        NSMutableString *txtGenre = [[NSMutableString alloc] init];
//        for (NSString * genre in [self.jamData objectForKey:@"genres"])
//        {
//            [txtGenre appendFormat:@"%@ ",genre];
//        }
//        self.lblGenres.text = txtGenre;
    }
    
    
    self.arrJamMembers = [self.jamData objectForKey:@"jamMembers"];
    [self.tableView registerNib:[UINib nibWithNibName:@"JFJamMemberCell" bundle:nil] forCellReuseIdentifier:@"jamCell"];
    
    /*CLLocationCoordinate2D annotationCoord;
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotationCoord.latitude = [[self.data objectForKey:@"latitude"] floatValue];
    annotationCoord.longitude = [[self.data objectForKey:@"longitude"] floatValue];
    annotation.coordinate = annotationCoord;
    annotation.title = [self.data objectForKey:@"location"];*/
    
    //[self.mapView addAnnotation:annotation];
    
    //MKCoordinateRegion Stockton = MKCoordinateRegionMake(CLLocationCoordinate2DMake(annotationCoord.latitude,annotationCoord.longitude), MKCoordinateSpanMake(0.001, 0.001));
    //[self.mapView setRegion:Stockton];

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

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
