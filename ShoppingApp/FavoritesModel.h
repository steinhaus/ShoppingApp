//
//  FavoritesModel.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 11/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoritesModel : NSObject


@property (nonatomic, copy) NSString *loja;
@property (nonatomic, copy) NSString *categoria;
@property (nonatomic, copy) NSString *subcategoria;
@property (nonatomic, assign) BOOL active;
@end
