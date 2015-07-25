//
//  MapViewController.m
//  keyfinder
//
//  Created by System Administrator on 7/18/15.
//  Copyright (c) 2015 System Administrator. All rights reserved.
//

#import "MapViewController.h"
#import "SettingViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [_mapView setDelegate:self];
    [_mapView setShowsUserLocation:YES];
    
    CLLocationCoordinate2D userLocation = CLLocationCoordinate2DMake(37.325488,-122.032242);
    [self addPinToMapAtLocation:userLocation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation, 2000, 2000);
    [self.mapView setRegion:region animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)didClickBarButtonBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)didClickBarButtonSetting:(id)sender{
    SettingViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    [self.navigationController pushViewController:viewController animated:YES];
    
}

- (void)addPinToMapAtLocation:(CLLocationCoordinate2D)location
{

    _keypin = [[MKPointAnnotation alloc] init];
    _keypin.coordinate = location;
    [self.mapView addAnnotation:_keypin];
//    _keypin.coordinate = location.coordinate;
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    MKAnnotationView *annView = [[MKAnnotationView alloc ] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
    
    UIImage* imgPin= [UIImage imageNamed:@"pin.png"];
    
    annView.image = [self imageWithImage:imgPin scaledToSize:CGSizeMake(51, 75)];
    
    annView.canShowCallout = YES;
    return annView;
    
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
