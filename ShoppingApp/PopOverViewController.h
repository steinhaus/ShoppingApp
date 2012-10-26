//
//  PopOverViewController.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 19/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewTypes.h"

@interface PopOverViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *cardapio;
@property (weak, nonatomic) IBOutlet UIButton *meLeva;
@property (weak, nonatomic) IBOutlet UIButton *reservar;
@property (weak, nonatomic) IBOutlet UIButton *comprar;
@property (assign, nonatomic) int count;
- (id) initWithView:(UIView*)definedView andType:(ViewTypes)type;
- (IBAction) buttonTouched:(id)sender;
- (IBAction) buttonUp:(id)sender;
- (void) loadButtonsFavorites;
- (void) loadButtonsCinema;
- (void) loadButtonsWishList;
@end
