//
//  FavoriteCell.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 11/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavoriteCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *loja;
@property (weak, nonatomic) IBOutlet UILabel *categoria;
@property (weak, nonatomic) IBOutlet UIButton *opcoes;
@property (nonatomic, assign) int ref;
@property (weak, nonatomic) IBOutlet UIButton *excluir;
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
- (IBAction)opcoesTouch:(id)sender;

- (IBAction)excluirTouch:(id)sender;



@end
