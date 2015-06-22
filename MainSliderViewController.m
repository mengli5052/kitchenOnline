//
//  MainSliderViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/21.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MainSliderViewController.h"
#import "kitchenOnlineViewController.h"
#import "SettingViewController.h"
#import "TestViewController.h"
@interface MainSliderViewController ()

@end

@implementation MainSliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewController];
    // Do any additional setup after loading the view.
}
-(void)createViewController{
    //主页面
    NSLog(@"%s  %d",__func__,__LINE__);
    kitchenOnlineViewController *kitchen=[[kitchenOnlineViewController alloc]init];
    self.MainVC=kitchen;
     NSLog(@"%s  %d",__func__,__LINE__);
    //左边
    SettingViewController *leftVc=[[SettingViewController alloc]init];
    leftVc.view.backgroundColor=[UIColor purpleColor];
    self.LeftVC=leftVc;
    TestViewController *test=[[TestViewController alloc]init];
    self.RightVC=test;
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
