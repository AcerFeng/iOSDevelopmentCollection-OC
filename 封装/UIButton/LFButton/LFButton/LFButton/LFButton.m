//
//  LFButton.m
//  LFButton
//
//  Created by lanfeng on 2017/7/21.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "LFButton.h"
#import "UILabel+LFCalculate.h"
#import "UIView+LFFrame.h"

@interface LFButton ()
@property (nonatomic, assign) CGFloat minWidth;
@property (nonatomic, assign) CGFloat minHeight;
@end

@implementation LFButton

- (instancetype)initWithFrame:(CGRect)frame
                   imageStyle:(LFBtnImageStyle)imageStyle
                  layoutStyle:(LFBtnLayoutStyle)layoutStyle
                         font:(UIFont *)font
                        title:(NSString *)title
                        image:(UIImage *)image
                        space:(CGFloat)space
                       offset:(CGFloat)margin
                     autoSize:(BOOL)autoSize {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageStyle = imageStyle;
        self.layoutStyle = layoutStyle;
        self.space = space;
        self.offsetMargin = margin;
        self.autoSize = autoSize;
        self.minWidth = frame.size.width;
        self.minHeight = frame.size.height;
        if (font) {
            self.titleLabel.font = font;
            self.titleLabel.backgroundColor = [UIColor redColor];
        }
        if (image) {
            [self setImage:image forState:UIControlStateNormal];
            
        }
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitle:title forState:UIControlStateNormal];
        //        self.backgroundColor = [UIColor yellowColor];
        [self layoutBtnSubviews]; //布局uibutton的子视图
    }
    return self;
}

- (void)layoutBtnSubviews{
    CGSize imageSize = self.currentImage.size;
    CGSize titleSize = [self.titleLabel getSize];
    
    CGFloat maxWidth = (imageSize.width > titleSize.width) ? imageSize.width : titleSize.width;
    
    CGFloat maxHeight = (imageSize.height > titleSize.height) ? imageSize.height : titleSize.height;
    
    CGRect tempFrame = self.frame;
    
    CGFloat autoWidth = self.frame.size.width;
    CGFloat autoHeight = self.frame.size.height;
    
    
    switch (self.imageStyle)
    {
        case LFBtnImageStyleDefault: //从图片角度 左 右 上 下
        {
            switch (self.layoutStyle) //按钮的方向  整体漂移的方向
            {
                case LFBtnLayoutStyleNone:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight);
                    if (_autoSize) //默认是自适应
                        
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  _space / 2.0, 0, -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -_space / 2.0, 0, _space / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleLeft:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX =  (autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  -offsetX + _space, 0,  offsetX - _space)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -offsetX, 0, offsetX)];
                }
                    break;
                case LFBtnLayoutStyleRight:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = - ((autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -offsetX, 0, offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, -offsetX - _space, 0, offsetX + _space)];
                }
                    break;
                case LFBtnLayoutStyleTop:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight + _offsetMargin;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = (autoHeight - maxHeight) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY , _space / 2.0, offsetY,  -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY,  -_space / 2.0, offsetY, _space / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleBottom:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight + _offsetMargin;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = -((autoHeight - maxHeight) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY , _space / 2.0, offsetY,  -_space / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY,  -_space / 2.0, offsetY, _space / 2.0)];
                }
                    break;
            }
        }
            break;
        case LFBtnImageStyleRight:
        {
            switch (self.layoutStyle)
            {
                case LFBtnLayoutStyleNone:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = _minSize.width;
                        autoHeight = _minSize.height;
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width - _space / 2.0, 0, imageSize.width + _space / 2.0)];
                    
                    CGFloat titleLabelWidth = titleSize.width;
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth + _space / 2.0, -0, -titleLabelWidth - _space / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleLeft:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = ((autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width - offsetX, 0, imageSize.width + offsetX)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth - offsetX + _space, 0, -titleLabelWidth + offsetX - _space)];
                }
                    break;
                case LFBtnLayoutStyleRight:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space + _offsetMargin, maxHeight);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = -((autoWidth - titleSize.width - imageSize.width) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width - offsetX - _space, 0, imageSize.width + offsetX + _space)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleLabelWidth - offsetX, 0, -titleLabelWidth + offsetX)];
                }
                    break;
                case LFBtnLayoutStyleTop:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight + _offsetMargin;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = (autoHeight - maxHeight) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY, -imageSize.width - _space / 2.0, offsetY, imageSize.width + _space / 2.0)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY, titleLabelWidth + _space / 2.0, offsetY, -titleLabelWidth - _space / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleBottom:
                {
                    self.minSize = CGSizeMake(imageSize.width + titleSize.width + _space, maxHeight + _offsetMargin);
                    if (_autoSize)
                    {
                        autoWidth = imageSize.width + titleSize.width + _space;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = maxHeight;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight + _offsetMargin;
                        }
                    }
                    
                    CGFloat offsetY = -((autoHeight - maxHeight) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-offsetY, -imageSize.width - _space / 2.0, offsetY, imageSize.width + _space / 2.0)];
                    
                    CGFloat titleLabelWidth = ceil(titleSize.width);
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-offsetY, titleLabelWidth + _space / 2.0, offsetY, - titleLabelWidth - _space / 2.0)];
                }
                    break;
            }
        }
            break;
            
        case LFBtnImageStyleTop:
        {
            switch (self.layoutStyle)
            {
                case LFBtnLayoutStyleNone:
                {
                    self.minSize = CGSizeMake(autoWidth, titleSize.height + titleSize.height + _space);
                    if (_autoSize)
                    {
                        autoWidth = maxWidth;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = titleSize.height + titleSize.height + _space;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height + _space) / 2.0, -imageSize.width / 2.0, -(imageSize.height + _space) / 2.0, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + _space) / 2.0, titleSize.width / 2.0, (titleSize.height + _space) / 2.0, -titleSize.width / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleLeft:
                {
                    if (_autoSize)
                    {
                        autoWidth = maxWidth + _offsetMargin;
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        autoHeight = titleSize.height + titleSize.height + _space;
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX =  (self.width - maxWidth) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, -(imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, (titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case LFBtnLayoutStyleRight:
                {
                    autoWidth = maxWidth + _offsetMargin;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = -((self.width - maxWidth) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, -(imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-(titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, (titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case LFBtnLayoutStyleTop:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space + _offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = ((autoHeight - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake((imageSize.height) / 2.0 - offsetY + _space, -imageSize.width / 2.0, -(imageSize.height) / 2.0 + offsetY - _space, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-titleSize.height / 2.0 - offsetY, titleSize.width / 2.0, titleSize.height / 2.0 + offsetY, -titleSize.width / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleBottom:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space + _offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = -((self.height - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(imageSize.height / 2.0 - offsetY, -imageSize.width / 2.0, -imageSize.height / 2.0  + offsetY, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(-titleSize.height / 2.0 - offsetY - _space, titleSize.width / 2.0, titleSize.height / 2.0 + offsetY + _space, -titleSize.width / 2.0)];
                }
                    break;
            }
        }
            break;
            
        case LFBtnImageStyleBottom:
        {
            switch (self.layoutStyle)
            {
                case LFBtnLayoutStyleNone:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height + _space) / 2.0, -imageSize.width / 2.0, (imageSize.height + _space) / 2.0, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + _space) / 2.0, titleSize.width / 2.0, -(titleSize.height + _space) / 2.0, -titleSize.width / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleLeft:
                {
                    autoWidth = maxWidth + _offsetMargin;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX =  (self.width - maxWidth) / 2.0 - _offsetMargin;
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, (imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, -(titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case LFBtnLayoutStyleRight:
                {
                    autoWidth = maxWidth + _offsetMargin;
                    autoHeight = titleSize.height + titleSize.height + _space;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetX = -((self.width - maxWidth) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height + _space) / 2.0, -imageSize.width / 2.0 - offsetX, (imageSize.height + _space) / 2.0, imageSize.width / 2.0 + offsetX)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake((titleSize.height + _space) / 2.0, titleSize.width / 2.0 - offsetX, -(titleSize.height + _space) / 2.0, -titleSize.width / 2.0 + offsetX)];
                }
                    break;
                case LFBtnLayoutStyleTop:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space +_offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = ((autoHeight - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height) / 2.0 - offsetY, -imageSize.width / 2.0, (imageSize.height) / 2.0 + offsetY, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(titleSize.height / 2.0 - offsetY + _space, titleSize.width / 2.0, -titleSize.height / 2.0 + offsetY - _space, -titleSize.width / 2.0)];
                }
                    break;
                case LFBtnLayoutStyleBottom:
                {
                    autoWidth = maxWidth;
                    autoHeight = titleSize.height + titleSize.height + _space +_offsetMargin;
                    self.minSize = CGSizeMake(autoWidth, autoHeight);
                    if (_autoSize)
                    {
                        if (_minWidth > autoWidth)
                        {
                            autoWidth = _minWidth;
                        }
                        
                        if (_minHeight > autoHeight)
                        {
                            autoHeight = _minHeight;
                        }
                    }
                    
                    CGFloat offsetY = -((autoHeight - titleSize.height - imageSize.height) / 2.0 - _offsetMargin);
                    
                    [self setTitleEdgeInsets:UIEdgeInsetsMake(-(imageSize.height) / 2.0 - offsetY, -imageSize.width / 2.0, (imageSize.height) / 2.0 + offsetY, imageSize.width / 2.0)];
                    
                    [self setImageEdgeInsets:UIEdgeInsetsMake(titleSize.height / 2.0 - offsetY + _space, titleSize.width / 2.0, -titleSize.height / 2.0 + offsetY - _space, -titleSize.width / 2.0)];
                }
                    break;
            }
        }
            break;
        default:
            break;
    }
    
    if (_autoSize)
    {
        tempFrame.size = CGSizeMake(ceilf(autoWidth), ceilf(autoHeight));
        
        self.frame = tempFrame;
    }
    
}

@end
