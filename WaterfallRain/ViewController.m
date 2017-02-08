//
//  ViewController.m
//  WaterfallRain
//
//  Created by zivInfo on 17/1/18.
//  Copyright © 2017年 xiwangtech.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WaterfallRainView *waterfallRainView = [[WaterfallRainView alloc] init];
    waterfallRainView.frame = CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:waterfallRainView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
