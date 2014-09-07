//
//  JFViewJamsVC.h
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JFViewJamsVC : UIViewController <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property IBOutlet UITableView *tableView; 
@property IBOutlet MKMapView *mapView;
@property IBOutlet UILabel *lblLocation, *lblDate, *lblTime, *lblGenres, *lblMembers;
@property NSMutableArray *arrJamMembers; 
@property NSMutableDictionary *data; 
@property NSUInteger indexNumber;
@property NSMutableArray *annotations;

@end
