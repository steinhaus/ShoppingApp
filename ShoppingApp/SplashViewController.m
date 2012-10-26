//
//  SplashViewController.m
//  ShoppingApp
//
//  Created by Felipe Gringo on 10/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "SplashViewController.h"

@interface SplashViewController ()

@end


@implementation SplashViewController

- (void)callMain{
    [self performSegueWithIdentifier:@"MainMenuSegue" sender:nil];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self performSelector:@selector(callMain) withObject:nil afterDelay:3.0f];
    

}

@end
