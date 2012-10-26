//
//  MainMenuViewController.m
//  ShoppingApp
//
//  Created by Felipe Gringo on 10/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()
{
    LocationNotifier* locationNotifier;
}
@end

static BOOL isFirstTime = YES;
static BOOL highlight = YES;

@implementation MainMenuViewController
@synthesize carView, myPositionView, buttonLocalizacao, buttons;
- (void)viewDidLoad{
    [super viewDidLoad];
    if(isFirstTime)[self.view addSubview:carView];
    isFirstTime = NO;
    if(!highlight) [self unhighlightButton];
    for(id _button in self.buttons) {
        UIButton *button = (UIButton*) _button;
        NSInteger tag = button.tag;
        NSString* name = [NSString stringWithFormat:@"menu-button-selected-%d.png", tag];
        UIImage* image = [UIImage imageNamed:name];
        [button setBackgroundImage:image forState:UIControlStateHighlighted];
        [button setBackgroundImage:image forState:UIControlStateSelected];
    }
    locationNotifier = [[LocationNotifier alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationNotifierDeactivated:) name:@"LocationNotifierDeactivated" object:nil];
}


- (void) locationNotifierDeactivated:(NSNotification*)notification {
    highlight = NO;
    [self unhighlightButton];
}

- (void) highlightButton {
    [buttonLocalizacao setAlpha:1];
    
}

- (void) unhighlightButton {
    [buttonLocalizacao setAlpha:0.2];
    
}

- (IBAction)localizacaoTouch:(id)sender {
    
    if(highlight) {
        [self unhighlightButton];
        [locationNotifier deactivate];
        highlight = NO;
    }
    else {
        [self highlightButton];
        [locationNotifier activate];
        highlight = YES;
    }
}
- (IBAction)carViewYesTouched:(id)sender {
    [carView removeFromSuperview];
    [self.view addSubview:myPositionView];
}

- (IBAction)carViewNoTouched:(id)sender {
    [carView removeFromSuperview];
    [self.view addSubview:myPositionView];
}

- (IBAction)myPositionViewYesTouched:(id)sender {
    [self highlightButton];
    [locationNotifier activate];
    highlight = YES;
    [myPositionView removeFromSuperview];
}

- (IBAction)myPositionViewNoTouched:(id)sender {
    [self unhighlightButton];
    [locationNotifier deactivate];
    highlight = NO;
    [myPositionView removeFromSuperview];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id destinationController = [segue destinationViewController];
    if([destinationController isKindOfClass:[CinemaViewController class]]) {
        [(CinemaViewController*)destinationController startWith:[DataProvider CinemaExamples] cell:@"FavoriteCell"];
        
    }
    else if([destinationController isKindOfClass:[WishListViewController class]]) {
        [(WishListViewController*)destinationController startWith:[DataProvider WishListExamples] cell:@"FavoriteCell"];
       
    }
    else if([destinationController isKindOfClass:[FavoritesViewController class]]) {
        [(FavoritesViewController*)destinationController startWith:[DataProvider FavoritesExamples] cell:@"FavoriteCell"];
    }
    
}

@end
