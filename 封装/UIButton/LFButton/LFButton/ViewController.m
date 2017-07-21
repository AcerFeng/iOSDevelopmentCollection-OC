//
//  ViewController.m
//  LFButton
//
//  Created by lanfeng on 2017/7/21.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "ViewController.h"
#import "LFButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LFButton *testButton1 = [[LFButton alloc] initWithFrame:CGRectMake(20, 70, 100, 50) imageStyle:LFBtnImageStyleTop layoutStyle:LFBtnLayoutStyleRight font:[UIFont systemFontOfSize:20] title:@"点击" image:[UIImage imageNamed:@"good-select-normal"] space:0 offset:0 autoSize:NO];
    testButton1.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton1];
    
    LFButton *testButton2 = [[LFButton alloc] initWithFrame:CGRectMake(20, 124, 100, 60) imageStyle:LFBtnImageStyleTop layoutStyle:LFBtnLayoutStyleRight font:[UIFont systemFontOfSize:20] title:@"点击" image:[UIImage imageNamed:@"good-select-normal"] space:10 offset:0 autoSize:NO];
    testButton2.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton2];
    
    LFButton *testButton3 = [[LFButton alloc] initWithFrame:CGRectMake(20, 186, 100, 60) imageStyle:LFBtnImageStyleTop layoutStyle:LFBtnLayoutStyleRight font:[UIFont systemFontOfSize:20] title:@"点击" image:[UIImage imageNamed:@"good-select-normal"] space:0 offset:10 autoSize:NO];
    testButton3.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton3];
    
    LFButton *testButton4 = [[LFButton alloc] initWithFrame:CGRectMake(130, 70, 100, 50) imageStyle:LFBtnImageStyleRight layoutStyle:LFBtnLayoutStyleBottom font:[UIFont systemFontOfSize:20] title:@"点击" image:[UIImage imageNamed:@"good-select-normal"] space:0 offset:0 autoSize:NO];
    testButton4.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton4];
    
    LFButton *testButton5 = [[LFButton alloc] initWithFrame:CGRectMake(130, 124, 100, 50) imageStyle:LFBtnImageStyleRight layoutStyle:LFBtnLayoutStyleBottom font:[UIFont systemFontOfSize:20] title:@"点击" image:[UIImage imageNamed:@"good-select-normal"] space:0 offset:10 autoSize:NO];
    testButton5.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton5];
    
    LFButton *testButton6 = [[LFButton alloc] initWithFrame:CGRectMake(130, 186, 100, 50) imageStyle:LFBtnImageStyleRight layoutStyle:LFBtnLayoutStyleBottom font:[UIFont systemFontOfSize:20] title:@"点击" image:[UIImage imageNamed:@"good-select-normal"] space:10 offset:0 autoSize:NO];
    testButton6.backgroundColor = [UIColor redColor];
    [self.view addSubview:testButton6];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
