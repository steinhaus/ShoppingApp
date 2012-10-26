//
//  LocationViewController.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 19/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "UIViewControllerLandscape.h"
@interface LocationViewController : UIViewControllerLandscape <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager* locationManager;

@end
