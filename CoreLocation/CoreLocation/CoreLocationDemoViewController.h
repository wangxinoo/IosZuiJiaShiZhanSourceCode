//
//  CoreLocationDemoViewController.h
//  CoreLocation
//
//  Created by msdcn on 8/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CoreLocationDemoViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblLongitude;
@property (weak, nonatomic) IBOutlet UILabel *lblLatitude;
@property (weak, nonatomic) IBOutlet UILabel *lblHorizontalAccuracy;
@property (weak, nonatomic) IBOutlet UILabel *lblAltitude;
@property (weak, nonatomic) IBOutlet UILabel *lblVerticalAccuracy;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;
@property (strong, nonatomic) CLLocation *startLocation;

@end
