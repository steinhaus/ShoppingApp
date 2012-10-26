//
//  MainMenuViewController.h
//  ShoppingApp
//
//  Created by Felipe Gringo on 10/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoritesViewController.h"
#import "WishListViewController.h"
#import "CinemaViewController.h"
#import "UIViewControllerLandscape.h"
#import "LocationNotifier.h"
@interface MainMenuViewController : UIViewControllerLandscape
{

}
- (IBAction)localizacaoTouch:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *carView;
@property (strong, nonatomic) IBOutlet UIView *myPositionView;
@property (weak, nonatomic) IBOutlet UIButton *buttonLocalizacao;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *buttons;



- (IBAction)carViewYesTouched:(id)sender;
- (IBAction)carViewNoTouched:(id)sender;
- (IBAction)myPositionViewYesTouched:(id)sender;
- (IBAction)myPositionViewNoTouched:(id)sender;

- (void) highlightButton;
- (void) unhighlightButton;
- (void) locationNotifierDeactivated:(NSNotification *) notification;



@end
