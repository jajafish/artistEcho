//
//  JFMapViewController.h
//  artistEco
//
//  Created by Paul Sukhanov on 9/6/14.
//  Copyright (c) 2014 Jared Fishman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface JFMapViewController : UIViewController

@property NSMutableArray *annotations;
@property IBOutlet MKMapView *mapView;

@end
