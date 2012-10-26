//
//  RestauranteViewController.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 17/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "RestauranteViewController.h"

@implementation RestauranteViewController

- (IBAction)touchFavoritos:(id)sender {

}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id destinationController = [segue destinationViewController];
    if([destinationController isKindOfClass:[FavoritesViewController class]]) {
        [(FavoritesViewController*)destinationController startWith:[DataProvider FavoritesRestaurantExamples] cell:@"FavoriteRestaurantCell"];
    }
}
@end
