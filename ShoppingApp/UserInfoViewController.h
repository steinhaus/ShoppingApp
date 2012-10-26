//
//  UserInfoViewController.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 23/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIViewControllerLandscape.h"
#import "UserInfoCell.h"
@interface UserInfoViewController : UIViewControllerLandscape <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
