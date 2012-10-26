//
//  TableViewController.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 23/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoritesModel.h"
#import "FavoriteCell.h"
#import "DataProvider.h"
#import "UIViewControllerLandscape.h"
#import "PopOverViewController.h"
#import "ViewTypes.h"



@interface TableViewController : UIViewControllerLandscape <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *favorites;
    NSString *identifier;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (strong, nonatomic) UIView *popOver;
@property (strong, nonatomic) PopOverViewController* popOverController;
@property (assign, nonatomic) ViewTypes viewType;
- (void) opcoesTouch:(NSNotification *) notification;
- (void) excluirTouch:(NSNotification *) notification;
- (void) touchedAnywhere:(NSNotification *) notification;
- (void) startWith:(NSMutableArray*)data cell:(NSString*)name;



@end
