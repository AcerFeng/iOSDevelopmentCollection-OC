//
//  TwoViewController.m
//  MBProgress_使用
//
//  Created by sunshine on 2017/8/26.
//  Copyright © 2017年 sunshine. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController


/***第一个执行***/
- (void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@"11111111");
}

/***第二个执行***/
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"22222222");
}

/***第三个执行***/
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"33333333");
};

/***第四个执行***/
- (void)updateViewConstraints{
    [super updateViewConstraints];
    NSLog(@"44444444");
}


/***第五个执行***/
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    NSLog(@"55555555");
}


/***第六个执行***/
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    NSLog(@"66666666");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
