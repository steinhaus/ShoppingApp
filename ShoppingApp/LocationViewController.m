//
//  LocationViewController.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 19/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController()

{
    CLLocation *morumbi, *marketPlace, *jk, *cidJardim;
}

@end
@implementation LocationViewController
@synthesize locationManager;
- (void) viewDidLoad {
    CLLocationCoordinate2D morumbiC, marketPlaceC, jkC, cidJardimC;
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BG.png"]];
    self.view.backgroundColor = background;
    
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager setDistanceFilter:100];

    [self.locationManager startUpdatingLocation];
    morumbiC = CLLocationCoordinate2DMake(-23.62369, -46.69335);
    marketPlaceC = CLLocationCoordinate2DMake(-23.62141, -46.70005);
    jkC = CLLocationCoordinate2DMake(-23.59136, -46.69069);
    cidJardimC = CLLocationCoordinate2DMake(-23.56510, -46.70507);
    
    
    
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    for(CLLocation* location in locations) {
       //float longi = location.coordinate.longitude;
        //float lati = location.coordinate.latitude;
        /*CLLocationDistance dMorumbi = [morumbi distanceFromLocation:location];
        CLLocationDistance dmarketPlace = [marketPlace distanceFromLocation:location];
        CLLocationDistance djk = [jk distanceFromLocation:location];
        CLLocationDistance dcidJardim = [cidJardim distanceFromLocation:location];
       
        NSLog(@"Morumbi: (%f)",dMorumbi);
        NSLog(@"Morumbi: (%f)",dmarketPlace);
        NSLog(@"Morumbi: (%f)",djk);
        NSLog(@"Morumbi: (%f)",dcidJardim);*/
        
    }
}

@end
