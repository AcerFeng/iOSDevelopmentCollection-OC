//
//  UILabel+LFCalculate.m
//  LFButton
//
//  Created by lanfeng on 2017/7/21.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "UILabel+LFCalculate.h"

@implementation UILabel (LFCalculate)
- (CGSize)getSize
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    paragraphStyle.alignment = self.textAlignment;
    NSDictionary *attributes = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(self.bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

@end
