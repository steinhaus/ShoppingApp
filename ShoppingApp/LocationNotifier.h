//
//  locationNotifier.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 19/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface LocationNotifier : NSObject <CLLocationManagerDelegate>

- (void) activate;
- (void) deactivate;


@property (assign, nonatomic) float distanceFromOrigin;

@end
