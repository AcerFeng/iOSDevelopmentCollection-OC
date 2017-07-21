//
//  LFButton.h
//  LFButton
//
//  Created by lanfeng on 2017/7/21.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

//图片在文字的布局位置
typedef NS_ENUM(NSInteger, LFBtnImageStyle) {
    LFBtnImageStyleDefault = 0, //图片默认是在左边
    LFBtnImageStyleRight,
    LFBtnImageStyleTop,
    LFBtnImageStyleBottom,
    
};

//图片文字的整体偏移方向
typedef NS_ENUM(NSInteger, LFBtnLayoutStyle) {
    LFBtnLayoutStyleNone = 0,
    LFBtnLayoutStyleLeft,
    LFBtnLayoutStyleRight,
    LFBtnLayoutStyleTop,
    LFBtnLayoutStyleBottom,
};

@interface LFButton : UIButton
@property (nonatomic ,assign)LFBtnImageStyle imageStyle;
@property (nonatomic ,assign)LFBtnLayoutStyle layoutStyle;
@property (nonatomic ,assign)CGFloat space;
@property (nonatomic ,assign)CGFloat offsetMargin;
@property (nonatomic ,assign)BOOL autoSize; //自适应大小

@property (nonatomic, assign) CGSize minSize;

/**
 *  @param frame 按钮的frame
 *  @param imageStyle 图片位于文本的哪个方位
 *  @param layoutStyle 文本和图片的整体偏移方向
 *  @param font 文本字体的字号
 *  @param title button的标题
 *  @param image button的图片
 *  @param space  图片和文本的间距离
 *  @param margin 图片跟文本整体偏移的距离
 *  @param autoSize YES:按钮适应图片跟文本的大小
 */


- (instancetype)initWithFrame:(CGRect)frame
                   imageStyle:(LFBtnImageStyle)imageStyle
                  layoutStyle:(LFBtnLayoutStyle)layoutStyle
                         font:(UIFont *)font
                        title:(NSString *)title
                        image:(UIImage *)image
                        space:(CGFloat)space
                       offset:(CGFloat)margin
                     autoSize:(BOOL)autoSize;
@end
