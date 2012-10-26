//
//  LandscapeUIViewController.m
//  ShoppingApp
//
//  Created by Felipe Gringo on 10/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "UIViewControllerLandscape.h"

@interface UIViewControllerLandscape ()

@end

@implementation UIViewControllerLandscape
- (IBAction)dismissThisViewController:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape ;
}
@end
