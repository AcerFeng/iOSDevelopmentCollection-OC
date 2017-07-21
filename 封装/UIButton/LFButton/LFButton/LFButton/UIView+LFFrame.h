//
//  UIView+LFFrame.h
//  LFButton
//
//  Created by lanfeng on 2017/7/21.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LFFrame)
@property CGFloat top;
@property CGFloat bottom;
@property CGFloat left;
@property CGFloat right;

@property CGFloat centerX;
@property CGFloat centerY;

@property CGFloat height;
@property CGFloat width;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;
@end
