//
//  MapViewController.h
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKMapView+ZoomLevel.h"

@interface MapViewController : UIViewController<
MKMapViewDelegate, MKAnnotation,
CLLocationManagerDelegate>

@property (nonatomic, retain) IBOutlet MKMapView* mapView;

-(IBAction)didClickBarButtonBack:(id)sender;
-(IBAction)didClickBarButtonSetting:(id)sender;

@property (strong, nonatomic) MKPointAnnotation *keypin;

@end
