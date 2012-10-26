//
//  UserInfoViewController.m
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 23/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//

#import "UserInfoViewController.h"

@implementation UserInfoViewController
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 28;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
        UserInfoCell  *cell = nil;
        NSString *identifier=@"UserInfoCell";
        cell = (UserInfoCell*) [self.tableView dequeueReusableCellWithIdentifier:identifier];
        
        
        if(!cell)
        {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:identifier owner:nil options:nil];
            
            for(id currentObject in topLevelObjects)
            {
                if([currentObject isKindOfClass:[UserInfoCell class]])
                {
                    cell = (UserInfoCell *)currentObject;
                    break;
                }
            }
        }
     
        return cell;

}
@end
