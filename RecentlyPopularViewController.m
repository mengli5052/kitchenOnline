//
//  RecentlyPopularViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/21.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "RecentlyPopularViewController.h"
#import "MenuDetailViewController.h"
#import "MenuDetailModel.h"

@interface RecentlyPopularViewController ()
{
  
}
@end

@implementation RecentlyPopularViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadDataWithUrl:kRecentPopularUrl];
  
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
