//
//  ViewController.m
//  MBProgress_使用
//
//  Created by sunshine on 2017/8/26.
//  Copyright © 2017年 sunshine. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

#import "MBProgressHUD+CY.h"
#import "UIResponder+LKNotification.h"


@interface ViewController ()<LKNotificationDelegate>
@property (strong, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"MBProgress";
}

/*******默认菊花*******/
- (IBAction)defaultMBProgress:(id)sender {
    
    MBProgressHUD *HUD = [MBProgressHUD defaultMBProgress:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hide:YES];
    });
}

/*******默认菊花带文字*******/
- (IBAction)defaultMBProgressWithText:(id)sender {
    MBProgressHUD *HUD = [MBProgressHUD defaultMBProgressWithText:@"玩命加载中..."  view:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hide:YES];
    });
}

/*******显示正确_图片*******/
- (IBAction)loadSuccess:(id)sender {
    [MBProgressHUD showSuccess:@"成功啦" view:nil];
}


/*******显示错误_图片*******/
- (IBAction)loadError:(id)sender {
    [MBProgressHUD showError:@"失败啦" view:nil];
}


/*******仅文字提示无回调操作*******/
- (IBAction)showNotice_noBack:(id)sender {
    [MBProgressHUD showNotice:@"哇哈哈哈哈哈哈" view:nil];
}


/*******提示有回调操作*******/
- (IBAction)showNotice_haveBack:(id)sender {
    MBProgressHUD *HUD = [MBProgressHUD defaultMBProgressWithText:@"玩命加载中..." view:nil];
    HUD.completionBlock = ^(){
        //hud消失回调
        MBProgressHUD *HUD_2 = [MBProgressHUD showNotice:@"请先登录" view:nil];
        [HUD_2 hide:YES afterDelay:0.5];
        HUD_2.completionBlock = ^(){
            //hud消失回调
            TwoViewController *twoVC = [TwoViewController new];
            [self.navigationController pushViewController:twoVC animated:YES];
        };
    };
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hide:YES];
    });

}


/*******显示用户图和文字*******/
- (IBAction)showQRCodeView:(id)sender {
    MBProgressHUD *HUD = [MBProgressHUD createHUD:nil];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.color = [UIColor whiteColor];
    HUD.dimBackground = YES;//背景变灰色默认为NO无背景
    HUD.square = NO;
    HUD.labelText = @"扫一扫 领红包...";
    HUD.labelFont = [UIFont systemFontOfSize:18];
    HUD.labelColor = [UIColor blackColor];
    HUD.animationType = MBProgressHUDAnimationFade;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code"]];
    HUD.customView = imageView;
    //扫二维码或者提示
    [HUD addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideHUD:)]];
}

- (void)hideHUD:(UIGestureRecognizer *)recognizer
{
    [(MBProgressHUD *)recognizer.view hide:YES];
}



/*******显示自定义帧动画*******/
- (IBAction)showAnimate:(id)sender {
    [self showCustomLoadAnimate:nil];
}

- (void)showCustomLoadAnimate:(UIView *)view{
    MBProgressHUD *HUD =  [MBProgressHUD showCustomAnimate:@"" imageName:@"dropdown_anim__" imageCounts:60 view:view];
    
    //延迟3秒模仿加载
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hide:YES];
    });
}



/*******显示错误动画*******/
- (IBAction)showErrorAnimate:(id)sender {
    [MBProgressHUD drawErrorViewWithText:@"出错啦~" view:nil];
}


/*******显示正确动画*******/
- (IBAction)showRightAnimate:(id)sender {
    [MBProgressHUD drawRightViewWithText:@"对啦啦~" view:nil];
}


/*******环形动画*******/
- (IBAction)drawRoundLoadView:(id)sender {
    MBProgressHUD *HUD = [MBProgressHUD drawRoundLoadingView:@"请稍后..." view:nil];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        // Do something useful in the background and update the HUD periodically.
        [self doSomeWorkWithMixedProgress];
        dispatch_async(dispatch_get_main_queue(), ^{
//            [hud hideAnimated:YES];
            [HUD hide:YES];
        });
    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [HUD hide:YES];
//    });
}

- (void)doSomeWorkWithMixedProgress {
    sleep(1);
    
        MBProgressHUD *hud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
        dispatch_async(dispatch_get_main_queue(), ^{
//            MBProgressHUD *hud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
//            hud.mode = MBProgressHUDModeIndeterminate;
//            hud.square = YES;
//            hud.labelFont = [UIFont systemFontOfSize:12];
//            hud.labelText = @"玩命加载中撒的发撒旦撒的发阿萨德地方啊是地方撒的发";
//            [MBProgressHUD drawRightViewWithText:@"对啦啦~" view:nil];
            hud.customView = [MBProgressHUD rightImageView];
        });
    
    sleep(1);
    dispatch_async(dispatch_get_main_queue(), ^{
        //            MBProgressHUD *hud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
                    hud.mode = MBProgressHUDModeIndeterminate;
                    hud.square = YES;
                    hud.labelFont = [UIFont systemFontOfSize:12];
                    hud.labelText = @"玩命加载中撒";
//        [MBProgressHUD drawRightViewWithText:@"对啦啦~" view:nil];
    });
    sleep(3);
//    MBProgressHUD *hud = [MBProgressHUD HUDForView:[UIApplication sharedApplication].keyWindow];
//    // Indeterminate mode
//    sleep(2);
//    // Switch to determinate mode
//    dispatch_async(dispatch_get_main_queue(), ^{
//        hud.mode = MBProgressHUDModeDeterminate;
//        hud.labelText = NSLocalizedString(@"Loading...", @"HUD loading title");
//    });
//    float progress = 0.0f;
//    while (progress < 1.0f) {
//        progress += 0.01f;
//        dispatch_async(dispatch_get_main_queue(), ^{
//            hud.progress = progress;
//        });
//        usleep(50000);
//    }
//    // Back to indeterminate mode
//    dispatch_async(dispatch_get_main_queue(), ^{
//        hud.mode = MBProgressHUDModeIndeterminate;
//        hud.labelText = NSLocalizedString(@"Cleaning up...", @"HUD cleanining up title");
//    });
//    sleep(2);
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//        hud.customView = imageView;
//        hud.mode = MBProgressHUDModeCustomView;
//        hud.labelText = NSLocalizedString(@"Completed", @"HUD completed title");
//    });
//    sleep(2);
}

/*******显示通知*******/
- (IBAction)showNotification:(id)sender {
    
    MBProgressHUD *HUD = [MBProgressHUD defaultMBProgressWithText:@"正在提交..." view:nil];
    HUD.completionBlock = ^(){
        [self showNotification];
    };
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUD hide:YES];
    });
}

- (void)showNotification{
    [self getLKNotificationManager].default_style = LK_NOTIFICATION_BAR_STYLE_DARK;
    LKNotificationBar *notificationBar = [[self getLKNotificationManager] createWithTitle: @"意见反馈" content:@"您的反馈提交成功!感谢您的反馈" icon: [UIImage imageNamed: @"TSYicon"]];
    notificationBar.delegate = self;
    [notificationBar showWithAnimated: YES];
    
    TwoViewController *two = [TwoViewController new];
    [self.navigationController pushViewController:two animated:YES];
}

- (void)onNavigationBarTouchUpInside:(LKNotificationBar *)navigationBar{
    [navigationBar hideWithAnimated: YES];
}



/*******显示在其它View上*******/
- (IBAction)showInOherView:(id)sender {
    //传nil默认显示在window
    [MBProgressHUD drawErrorViewWithText:@"出错啦~" view:_greenView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
