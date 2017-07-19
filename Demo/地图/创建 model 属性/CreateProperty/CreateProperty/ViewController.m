//
//  ViewController.m
//  CreateProperty
//
//  Created by lanfeng on 17/2/3.
//  Copyright © 2017年 lanfeng. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Property.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
//    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
//    NSArray *dictArr = dict[@"statuses"];
//    // 设计模型属性代码
//    [NSObject createPropertyCodeWithDict:dictArr[0][@"user"]];
    
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"Zhihu.json" ofType:nil];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:jsonFilePath] options:NSJSONReadingMutableContainers error:nil];
//    NSLog(@"%@", jsonDict);
    
    [NSObject createPropertyCodeWithDict:jsonDict];
//    [NSObject createPropertyCodeWithDict:jsonDict[@"stories"][0]];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
