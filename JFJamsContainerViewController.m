//
//  JFJamPageViewController.m
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import "JFJamsContainerViewController.h"
#import "JFViewJamsVC.h"
#import "JFJamSession.h"

@interface JFJamsContainerViewController ()

@end

@implementation JFJamsContainerViewController

-(CGFloat)topMapViewHeight
{
    return 84.0;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNumber *lat = [NSNumber numberWithDouble:37.767997];
    NSNumber *lng = [NSNumber numberWithDouble:-122.3921315];
    
    NSMutableDictionary *jam1 =  [@{@"location":@"123 Fake St.",@"latitude":lat,@"longitude":lng,@"date":@"Aug 23, 2014",@"time":@"5 PM",@"genres":@[@"rock",@"pop"],@"members":@[@{@"name":@"Stephanie"},@{@"name":@"Jared"},@{@"name":@"Paul"}]} mutableCopy];
    NSMutableDictionary *jam2 = [@{@"location":@"415 Folsom St",@"date":@"Sep 2, 2014",@"time":@"8 PM",@"genres":@[@"jazz"],@"members":@[@{@"name":@"Stephanie",@"audio_link":@"http:etc"},@{@"name":@"Jared"}]} mutableCopy];
    self.arrJams = [NSMutableArray array];
    self.annotations = [NSMutableArray array];

    [self.arrJams addObject:jam1]; 
    [self.arrJams addObject:jam2];
    
    
    CLLocationCoordinate2D loc;
    
    for (NSDictionary *jam in self.arrJams)
    {
        if ([jam objectForKey:@"latitude"] != 0){
            CGFloat lat = [[jam objectForKey:@"latitude"] floatValue];
            CGFloat longi = [[jam objectForKey:@"longitude"] floatValue];
            MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
            CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(lat, longi);
            NSLog(@"lat:%f long:%f",loc.latitude,loc.longitude);

            point.coordinate = loc;
            [self.annotations addObject:point];
        }
    }

    [self.mapView addAnnotations:self.annotations];
    
    MKCoordinateRegion Stockton = MKCoordinateRegionMake(CLLocationCoordinate2DMake([lat floatValue],[lng floatValue]), MKCoordinateSpanMake(0.05, 0.05));
    [self.mapView setRegion:Stockton];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.dataSource = self;
    
    [self.pageController.view setFrame:CGRectMake(0, self.view.bounds.size.height, 320, self.view.bounds.size.height-[self topMapViewHeight])];
    
    JFViewJamsVC *viewControllerObject = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:viewControllerObject];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    [self addChildViewController:self.pageController];
    [[self view] addSubview:self.pageController.view];
    [self.pageController didMoveToParentViewController:self];

    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
        [self queryForJamSessions];
}

-(void)queryForJamSessions
{
    PFQuery *jamQuery = [PFQuery queryWithClassName:@"JFJamSession"];
    [jamQuery includeKey:@"jamMembers"];
    [jamQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error){
            NSLog(@"success there are %lu jams", (unsigned long)objects.count);
            self.jamsViaParse = [objects mutableCopy];
            NSLog(@"here are all the jam sessions via parse: %@", self.jamsViaParse);
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView =
    (MKPinAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"pin"];
    if (!pinView)
    {
        MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                        reuseIdentifier:@"pin"];
        
        //NSLog(@"imageName:%@",imageName);
        UIImage *flagImage = [UIImage imageNamed:@"icons-09.png"];
        annotationView.image = flagImage;
        annotationView.canShowCallout = NO;
        return annotationView;
    }
    else {
        pinView.annotation = annotation;
    }
    return pinView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if (!self.jamViewExpanded){
        
        //you have to calculate how to get the map point annotation in the middle of the box in the top of the screen, by setting the center coordinate
        
        CLLocationCoordinate2D currentCoord = [view.annotation coordinate];
        //CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(<#CLLocationDegrees latitude#>, <#CLLocationDegrees longitude#>)
        //[self.mapView setCenterCoordinate:<#(CLLocationCoordinate2D)#> animated:<#(BOOL)#>]
        
        NSLog(@"annotation selected:%@",view);
        [UIView animateWithDuration:0.4 animations:^{
            CGRect frame = self.pageController.view.frame;
            frame.origin.y = [self topMapViewHeight];
            self.pageController.view.frame = frame;
        }];
        self.jamViewExpanded = YES;
    }
    else {
        [UIView animateWithDuration:0.4 animations:^{
            CGRect frame = self.pageController.view.frame;
            frame.origin.y = self.view.bounds.size.height;
            self.pageController.view.frame = frame;
        }];
        self.jamViewExpanded = NO;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(JFViewJamsVC*)viewController indexNumber];
    
    if (index == 0) {
        
        return nil;
        
    }
    index--;
    return [self viewControllerAtIndex:index];
}



- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(JFViewJamsVC *)viewController indexNumber];
    
    index++;
    if (index >= [self.jamsViaParse count]) {
        
        return nil;
        
    }
    return [self viewControllerAtIndex:index];
}

- (JFViewJamsVC*)viewControllerAtIndex:(NSUInteger)index {
    
    JFViewJamsVC *childViewController = [[JFViewJamsVC alloc] initWithNibName:@"JFViewJamsVC" bundle:nil];
    childViewController.indexNumber = index;
    NSMutableDictionary *jamData = [self.jamsViaParse objectAtIndex:index];
    childViewController.jamData = jamData;
    return childViewController;
    
}

/*- (void)setViewControllers:(NSArray *)viewControllers direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated completion:(void (^)(BOOL finished))completion
{
    NSMutableArray *arrVCs = [NSMutableArray array];
    for (NSMutableDictionary *jam in self.arrJams)
    {
        JFViewJamsVC *vc = [[JFViewJamsVC alloc] initWithNibName:@"JFViewJamsVC" bundle:nil];
        vc.data = jam;
        [arrVCs addObject:jam];
    }
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
