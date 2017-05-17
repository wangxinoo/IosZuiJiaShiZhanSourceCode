//
//  MapKitDemoViewController.m
//  MapKitDemo
//
//  Created by msdcn on 8/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapKitDemoViewController.h"
#import "SampleAnnotation.h"

@interface MapKitDemoViewController ()

@end

@implementation MapKitDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     CLLocationCoordinate2D zoomLocation;
     zoomLocation.latitude = 31.14;
     zoomLocation.longitude = 121.29;
     MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 600, 400);
     //mapkit setCenterCoordinate:<#(CLLocationCoordinate2D)#>
     //MKCoordinateRegion adjustedReion = [mapKit regionThatFits:viewRegion];
     
     //mapKit.mapType = MKMapTypeSatellite;
    
    SampleAnnotation *annotation = [[SampleAnnotation alloc] initWithCoordinate:zoomLocation];
    annotation.title = @"贝尚湾";
    annotation.subtitle = @"上海市松江区涞坊路350弄";
    
    //MKMapRect flyTo = MKMapRectNull;
    
    //MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
    //MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0);
    
    //flyTo = MKMapRectUnion(<#MKMapRect rect1#>, <#MKMapRect rect2#>)
    [self.mapView setRegion:viewRegion animated:YES];
    //mapView.zoomEnabled = NO;
    //mapView.showsUserLocation = YES;
    //mapKit.visibleMapRect = pointRect;
    [self.mapView addAnnotation:annotation];
    self.mapView.delegate = self;
}

-(void)mapView:(MKMapView *)sender didSelectAnnotationView:(MKAnnotationView *)view
{
    NSLog(@"testttt!");
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    NSLog(@"Here");
    static NSString *AnnotationViewIdentifier = @"AnnotationViewIdentifer";
    MKPinAnnotationView *aView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewIdentifier];
    if(aView == nil)
    {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ANNOT"];
    }
    aView.annotation = annotation;
    aView.pinColor = MKPinAnnotationColorPurple;
    aView.canShowCallout = YES;
    aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    UIImage *image = [UIImage imageNamed:@"image.jpeg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, 20.0, 35.0)];
    imageView.image = image;;
    aView.leftCalloutAccessoryView = imageView;
    //UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 200, 50)];
    //UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 80, 20)];
    //label.text = @"这里是一个测试标签";
    //[testView addSubview:label];
    //aView.leftCalloutAccessoryView = testView;
    return aView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    SampleAnnotation *annotation = view.annotation;
    NSString *title = annotation.title;
    NSString *subtitle = annotation.subtitle;
    UIAlertView *alert = [[UIAlertView alloc] 
                                    initWithTitle:title 
                                    message:subtitle 
                                    delegate:nil 
                                    cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidUnload
{
    [self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
