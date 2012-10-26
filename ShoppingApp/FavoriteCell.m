//
//  FavoriteCell.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 11/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "FavoriteCell.h"

@implementation FavoriteCell
@synthesize loja, categoria, excluir, opcoes, ref, bgImage;

- (IBAction)opcoesTouch:(id)sender {
    NSDictionary* data = [NSDictionary dictionaryWithObject:self forKey:@"self"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"opcoesTouch" object:nil userInfo:data];
}

- (IBAction)excluirTouch:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"excluirTouch" object:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDictionary* data = [NSDictionary dictionaryWithObject:self forKey:@"self"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"touchedAnywhere" object:nil userInfo:data];
}


@end
