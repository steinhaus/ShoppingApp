//
//  locationNotifier.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 19/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "LocationNotifier.h"
@interface LocationNotifier() {
    
    CLLocation *morumbi, *marketPlace, *jk, *cidJardim;
    BOOL active;
    CLLocationManager* locationManager;
    NSMutableArray* polygonMarketPlace;
    
}
@end
@implementation LocationNotifier
@synthesize distanceFromOrigin;

- (BOOL) isPoint:(CLLocation*)point inPolygon:(NSMutableArray*)polygon {
    float x = point.coordinate.latitude;
    float y = point.coordinate.longitude;
    for(id _vertex in polygon) {
        CLLocation* vertex = (CLLocation*) _vertex;
        
    }
    return NO;
}


- (id) init {
    id me = [super init];
    if(me) {
        locationManager = [[CLLocationManager alloc] init];
      
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        [locationManager setDistanceFilter:10];
        
        morumbi = [[CLLocation alloc] initWithLatitude:-23.62387128 longitude:-46.69870812];
        marketPlace = [[CLLocation alloc] initWithLatitude:-23.62141 longitude:-46.70005];
        jk = [[CLLocation alloc] initWithLatitude:-23.59136 longitude:-46.69069];
        cidJardim = [[CLLocation alloc] initWithLatitude:-23.56510 longitude:-46.700570];
        
        
        
        active = NO;
        self.distanceFromOrigin = 200;
    }
    return me;
}


- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    UIAlertView *alert;
    BOOL show = NO;
    for(CLLocation* location in locations) {
        double min;
        int minid = 0;
        NSString* message;
        NSLog(@"%@", location);
        CLLocationDistance dMorumbi = [morumbi distanceFromLocation:location];
        CLLocationDistance dmarketPlace = [marketPlace distanceFromLocation:location];
        CLLocationDistance djk = [jk distanceFromLocation:location];
        CLLocationDistance dcidJardim = [cidJardim distanceFromLocation:location];
        min = dMorumbi;
        if(min > dmarketPlace)  {
            min = dmarketPlace;
            minid = 1;
        }
        if(min > djk) {
            min = djk;
            minid = 2;
        }
        if(min > dcidJardim)  {
            min = dcidJardim;
            minid = 3;
        }
        show = YES;
        message = [[NSString alloc] initWithFormat:@"Você não está em nenhum shopping. Lat.:(%f) Long.(%f)",location.coordinate.latitude, location.coordinate.latitude];
        
        NSLog(@"%f %d",min,minid);
        if(min<distanceFromOrigin) {
            show = YES;
            
            switch (minid) {
                case 0:
                    message = @"Você está no Shopping Morumbi.";
                    break;
                case 1:
                    message = @"Você está no Shopping Market Place";
                    break;
                case 2:
                    message = @"Você está no Shopping JK";
                    break;
                case 3:
                    message = @"Você está no Shopping Cidade Jardim";
                    break;
                default:
                    return;
                    break;
            }
        }
       
        
        alert = [[UIAlertView alloc] initWithTitle:@"Shopping Garden Tatuapé"
                                           message:message
                                          delegate:nil
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles: nil];
        
        
      
    }
    if(show) {
        [alert show];
        [self deactivate];
    }
}

- (void) activate {
    if(active == YES) return;
    [locationManager startUpdatingLocation];
    active = YES;
}

- (void) deactivate {
    if(active== NO) return;
    [locationManager stopUpdatingLocation];
    active = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LocationNotifierDeactivated" object:nil];
}


@end
