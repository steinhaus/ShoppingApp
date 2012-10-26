//
//  TableViewController.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 23/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController
@synthesize tableView, title, popOver, labels, viewType;


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    [title setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:26]];
    [title setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    [tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BG.png"]]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(opcoesTouch:) name:@"opcoesTouch" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(excluirTouch:) name:@"excluirTouch" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(touchedAnywhere:) name:@"touchedAnywhere" object:nil];
    
    for(id _label in self.labels) {
        UILabel* label = (UILabel*) _label;
        [label setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
        [label setTextColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    }
    self.viewType = AGNOSTIC;
}


- (void) touchedAnywhere:(NSNotification *)notification {
    float color = (float) 236/255;
    [popOver removeFromSuperview];
    
    for(__strong id view in [self.tableView subviews]) {
        if([view isKindOfClass:[FavoriteCell class]]) {
            FavoriteCell* cell = (FavoriteCell*)view;
            [cell.bgImage setBackgroundColor:[UIColor colorWithRed:color green:color blue:color alpha:1] ];
            
        }
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    UIView* view = [touch view];
    float color = (float) 236/255;
    
    if(view.frame.size.width > 140) {
        [popOver removeFromSuperview];
        for(__strong id view in [self.tableView subviews]) {
            if([view isKindOfClass:[FavoriteCell class]]) {
                FavoriteCell* cell = (FavoriteCell*)view;
                [cell.bgImage setBackgroundColor:[UIColor colorWithRed:color green:color blue:color alpha:1] ];
            }
        }
        
    }
}

- (void) opcoesTouch:(NSNotification *) notification {
    NSDictionary *data = notification.userInfo;
    FavoriteCell* sender = [data valueForKey:@"self"];
    float color = (float) 236/255;
    
    for(__strong id view in [self.tableView subviews]) {
        if([view isKindOfClass:[FavoriteCell class]]) {
            FavoriteCell* cell = (FavoriteCell*)view;
            if(cell!=sender)
                [cell.bgImage setBackgroundColor:[UIColor colorWithRed:color green:color blue:color alpha:1] ];
        }
    }
    color = (float) 71/255;
    [sender.bgImage setBackgroundColor:[UIColor colorWithRed:color green:color blue:color alpha:0.4]];
    self.popOverController = [PopOverViewController alloc];
    [popOver removeFromSuperview];
    
    const int base = 80;
    float x = sender.opcoes.frame.origin.x;
    float y2 = sender.opcoes.frame.origin.y;
    float y = sender.opcoes.frame.size.height;
    //float resto = 60-y-y2;
    int ref = sender.ref;
    //int mod = (int)tableView.frame.size.height;
    float outro = tableView.contentOffset.y;
    
    y = (int)((y+y2+8)*ref+y)+base-outro+10;
    
    color = (float) 71/255;
    self.popOver = [UIView alloc];
    self.popOver = [self.popOver initWithFrame:CGRectMake(x-14, y, 140, 0)];
    self.popOver.backgroundColor = [UIColor colorWithRed:color green:color blue:color alpha:1];
    self.popOverController = [self.popOverController initWithView:self.popOver andType:self.viewType];
    self.popOver.alpha = 0;
    int popOverCount = self.popOverController.count;
    //CGRect theFrame = self.popOver.frame;
    // if(theFrame.origin.y+90>=320) theFrame.origin.y -=  24.f*4;
    
    [self.view addSubview:self.popOverController.view];
    [UIView animateWithDuration:.4f animations:^{
        CGRect theFrame = self.popOver.frame;
        if(theFrame.origin.y+101<300)
            theFrame.size.height += 25.5*popOverCount;
        else {
            //float dif = (theFrame.origin.y+72) - 320;
            theFrame.origin.y -= 137;
            theFrame.size.height += 25.5*popOverCount;
            //self.tableView.contentOffset = CGPointMake(0, dif);
        }
        self.popOver.frame = theFrame;
        
        self.popOver.alpha = 1;
    }];
    
}

- (void) excluirTouch:(NSNotification *)notification {
    NSDictionary *data = notification.userInfo;
    FavoriteCell *sender = [data valueForKey:@"self"];
    int ref = [sender ref];
    
    [UIView animateWithDuration:1.2f animations:^{
        float color = (float) 71/255;
        [sender.bgImage setBackgroundColor:[UIColor colorWithRed:color green:color blue:color alpha:0.4]];
    }
                     completion:^(BOOL finished){
                         if (finished) {
                             [favorites removeObjectAtIndex:ref];
                             [self.tableView reloadData];
                         }
                     }];
    
}

- (void) startWith:(NSMutableArray *)data cell:(NSString *)name {
    favorites = data;
    identifier = name;
    
    //tableView = [[UITableView alloc] init];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [favorites count];
}


- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if([identifier isEqualToString:@"FavoriteCell"]) {
        FavoriteCell  *cell = nil;
        cell = (FavoriteCell *) [self.tableView dequeueReusableCellWithIdentifier:identifier];
        
        FavoritesModel *favorite = [favorites objectAtIndex:[indexPath row]];
        
        if(!cell)
        {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil];
            
            for(id currentObject in topLevelObjects)
            {
                if([currentObject isKindOfClass:[FavoriteCell class]])
                {
                    cell = (FavoriteCell *)currentObject;
                    break;
                }
            }
        }
        [cell.loja setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
        [cell.categoria setFont:[UIFont fontWithName:@"Tw Cen MT Condensed" size:20]];
        //cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bh_gradient.png"]];
        cell.loja.text = favorite.loja;
        cell.categoria.text = favorite.categoria;
        cell.ref = [indexPath row];
        return cell;
    }
    return nil;
}

@end
