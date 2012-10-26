//
//  PopOverViewController.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 19/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "PopOverViewController.h"

@implementation PopOverViewController
@synthesize cardapio, meLeva, reservar, comprar, count;


- (id) initWithView:(UIView*)definedView andType:(ViewTypes)type {
    id me = [super init];
    if(me) {
        [self setView:definedView];
        switch (type) {
            case FAVORITES:
                [self loadButtonsFavorites];
                break;
            case CINEMA:
                [self loadButtonsCinema];
                break;
            case WISHLIST:
                [self loadButtonsWishList];
                break;
            case AGNOSTIC:
                [NSException raise:@"Agnostic view is not supported by this controller." format:@"Agnostic view is not supported by this controller."];
                break;
        }
        
    }
    return me;
}


- (void) loadButtonsWishList {
    UIImageView* icon;
    
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-menu.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    CGRect menu = CGRectMake(5, 0, 127, 26);
    self.cardapio = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cardapio setTitle:@"Cardápio" forState:UIControlStateNormal];
    self.cardapio.frame = menu;
    [self.cardapio.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.cardapio.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.cardapio setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.cardapio.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.cardapio setNeedsDisplay];
    
    
    
    [self.cardapio addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.cardapio addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardapio addSubview:icon];
    
    self.meLeva = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.meLeva.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.meLeva.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.meLeva setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.meLeva.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.meLeva setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.meLeva.frame = menu;
    [self.meLeva setTitle:@"MeLeva" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-MeLeva.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.meLeva addSubview:icon];
    [self.meLeva addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.meLeva addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.reservar = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.reservar.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.reservar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.reservar setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.reservar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.reservar setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.reservar.frame = menu;
    
    [self.reservar setTitle:@"Reservar" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-reserva.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.reservar addSubview:icon];
    [self.reservar addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.reservar addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.comprar = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.comprar.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.comprar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.comprar setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.comprar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.comprar setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.comprar.frame = menu;
    [self.comprar setTitle:@"Comprar" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-buy.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.comprar addSubview:icon];
    [self.comprar addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.comprar addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.view.alpha = 0;
    
    [self.view addSubview:self.cardapio];
    [self.view addSubview:self.meLeva];
    [self.view addSubview:self.reservar];
    [self.view addSubview:self.comprar];
    self.count = 4;
    
    
}


- (void) loadButtonsCinema {
    UIImageView* icon;
    
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-menu.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    CGRect menu = CGRectMake(5, 0, 127, 26);
    self.cardapio = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cardapio setTitle:@"Ticket" forState:UIControlStateNormal];
    self.cardapio.frame = menu;
    [self.cardapio.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.cardapio.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.cardapio setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.cardapio.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.cardapio setNeedsDisplay];
    
    
    
    [self.cardapio addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.cardapio addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardapio addSubview:icon];
    
    
    
    self.reservar = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.reservar.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.reservar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.reservar setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.reservar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.reservar setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.reservar.frame = menu;
    
    [self.reservar setTitle:@"Reservar" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-reserva.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.reservar addSubview:icon];
    [self.reservar addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.reservar addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.comprar = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.comprar.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.comprar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.comprar setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.comprar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.comprar setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.comprar.frame = menu;
    [self.comprar setTitle:@"Trailer" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-buy.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.comprar addSubview:icon];
    [self.comprar addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.comprar addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.view.alpha = 0;
    
    [self.view addSubview:self.cardapio];
    [self.view addSubview:self.reservar];
    [self.view addSubview:self.comprar];
    self.count = 3;
    
    
}


- (void) loadButtonsFavorites {
    UIImageView* icon;

    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-menu.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    CGRect menu = CGRectMake(5, 0, 127, 26);
    self.cardapio = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cardapio setTitle:@"Cardápio" forState:UIControlStateNormal];
    self.cardapio.frame = menu;
    [self.cardapio.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.cardapio.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.cardapio setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.cardapio.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.cardapio setNeedsDisplay];


    
    [self.cardapio addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.cardapio addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.cardapio addSubview:icon];
    
    self.meLeva = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.meLeva.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.meLeva.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.meLeva setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.meLeva.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.meLeva setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.meLeva.frame = menu;
    [self.meLeva setTitle:@"MeLeva" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-MeLeva.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.meLeva addSubview:icon];
    [self.meLeva addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.meLeva addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.reservar = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.reservar.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.reservar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.reservar setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.reservar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.reservar setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.reservar.frame = menu;
    
    [self.reservar setTitle:@"Reservar" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-reserva.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.reservar addSubview:icon];
    [self.reservar addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.reservar addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.comprar = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.comprar.titleLabel setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
    self.comprar.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.comprar setTitleColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1] forState:UIControlStateNormal];
    self.comprar.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    [self.comprar setNeedsDisplay];
    menu.origin.y += menu.size.height;
    self.comprar.frame = menu;
    [self.comprar setTitle:@"Comprar" forState:UIControlStateNormal];
    icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check-box-buy.png"]];
    icon.frame = CGRectMake(100, 0, 23,23);
    [self.comprar addSubview:icon];
    [self.comprar addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
    [self.comprar addTarget:self action:@selector(buttonUp:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    self.view.alpha = 0;
    
    [self.view addSubview:self.cardapio];
    [self.view addSubview:self.meLeva];
    [self.view addSubview:self.reservar];
    [self.view addSubview:self.comprar];
    self.count = 4;

    

}

- (IBAction) buttonTouched:(id)sender
{
    UIButton *button = (UIButton*) sender;
    NSString *image;
    if(button == self.cardapio) 
        image = @"check-box-menu-selected.png";
    else if (button == self.meLeva)
        image = @"check-box-MeLeva-selected.png";
    else if (button == self.reservar)
        image = @"check-box-reserva-selected.png";
    else if (button == self.comprar)
        image = @"check-box-buy-selected.png";
    else
        return;
    
    [button setAlpha:0.8];
    for(__strong id view in [button subviews]) {
        if([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
            view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
            [view setFrame:CGRectMake(100, 0, 23,23)];
            [button addSubview:view];
            
            
        }
    }
    
}

- (IBAction) buttonUp:(id)sender {
    UIButton* button = (UIButton*) sender;
    NSString *image;
    if(button == self.cardapio)
        image = @"check-box-menu.png";
    else if (button == self.meLeva)
        image = @"check-box-MeLeva.png";
    else if (button == self.reservar)
        image = @"check-box-reserva.png";
    else if (button == self.comprar)
        image = @"check-box-buy.png";
    else
        return;
    [button setAlpha:1];
    for(__strong id view in [button subviews]) {
        if([view isKindOfClass:[UIImageView class]]) {
            [view removeFromSuperview];
            view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
            [view setFrame:CGRectMake(100, 0, 23,23)];
            [button addSubview:view];
            
        }
    }
}


@end
