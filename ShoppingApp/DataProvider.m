//
//  DataProvider.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 15/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "DataProvider.h"



@implementation DataProvider
static NSMutableArray* favorites;
static NSMutableArray* wishList;
static NSMutableArray* movies;

+ (void)initialize {
    favorites = [[NSMutableArray alloc] init];
    FavoritesModel* item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Fast Shop";
    item1.categoria = @"Eletrônicos";
    [favorites addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Fast Shop";
    item1.categoria = @"Eletrônicos";
    [favorites addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Rascal";
    item1.categoria = @"Restaurante";
    [favorites addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Renner";
    item1.categoria = @"Deparmento";
    [favorites addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Lelis";
    item1.categoria = @"Moda feminina";
    [favorites addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Galletos";
    item1.categoria = @"Restaurante";
    [favorites addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Saraiva";
    item1.categoria = @"Livraria/Papelaria";
    [favorites addObject:item1];
    
    wishList = [[NSMutableArray alloc] init];
    
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Shampoo";
    item1.categoria = @"R$ 10,00";
    [wishList addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Halls";
    item1.categoria = @"R$  1,00";
    [wishList addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Calça";
    item1.categoria = @"R$ 99,00";
    [wishList addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Produto X";
    item1.categoria = @"R$ 11,30";
    [wishList addObject:item1];
    
    movies = [[NSMutableArray alloc] init];
    
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Batman";
    item1.categoria = @"Ação";
    //item1.classificacao = @"16";
    [movies addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Vertigo";
    item1.categoria = @"Suspense";
    //item1.classificacao = @"14";
    [movies addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Oldboy";
    item1.categoria = @"Suspense";
    //item1.classificacao = @"18";
    [movies addObject:item1];
    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Prometheus";
    item1.categoria = @"Ficção Científica";
    //item1.classificacao = @"18";
    [movies addObject:item1];
    
    
    
    
    for(id item in favorites) {
        [(FavoritesModel*)item setActive:YES];
    }
    for(id item in wishList) {
        [(FavoritesModel*)item setActive:YES];
    }
    for(id item in movies) {
        [(FavoritesModel*)item setActive:YES];
    }
}

+ (void) removeItem:(id)item {
    [(FavoritesModel*)item setActive:NO];
}

+ (NSMutableArray*) FavoritesRestaurantExamples {
    NSMutableArray* favorites = [[NSMutableArray alloc] init];
  
    FavoritesModel* item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Rascal";
    item1.categoria = @"Restaurante";
    item1.subcategoria = @"Pizzaria";
    [favorites addObject:item1];

    item1 = [[FavoritesModel alloc] init];
    item1.loja = @"Galletos";
    item1.categoria = @"Restaurante";
    item1.subcategoria = @"Internacional";
    [favorites addObject:item1];

    //[favorites shuffle];
    return favorites;
}

+ (NSMutableArray*) FavoritesExamples {
    return favorites;
}

+ (NSMutableArray*) WishListExamples {
    return wishList;
}

+ (NSMutableArray*) CinemaExamples {
    
    return movies;
}



@end
