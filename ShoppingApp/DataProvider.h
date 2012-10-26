//
//  DataProvider.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 15/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoritesModel.h"
#import "NSMutableArray_Shuffling.h"

@interface DataProvider : NSObject {
     
}

+ (NSMutableArray*) FavoritesExamples;
+ (NSMutableArray*) FavoritesRestaurantExamples;
+ (NSMutableArray*) CinemaExamples;
+ (NSMutableArray*) WishListExamples;
+ (void) removeItem:(id)item;
@end
