//
//  LatestViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/13.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "LatestViewController.h"

@interface LatestViewController ()

@end

@implementation LatestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title=@"最新";
    [self downloadDataWithUrl:kLatestUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
