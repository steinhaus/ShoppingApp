//
//  NSMutableArray_Shuffling.h
//  ShoppingApp
//
//  Created by Georges Kovacs Ribeiro on 15/10/12.
//  Copyright (c) 2012 Felipe Gringo. All rights reserved.
//
#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#include <Cocoa/Cocoa.h>
#endif

#import <Foundation/Foundation.h>

@interface NSMutableArray (Shuffling)
- (void) shuffle;

@end
