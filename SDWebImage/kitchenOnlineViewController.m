//
//  kitchenOnlineViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "kitchenOnlineViewController.h"
#import "BaseViewController.h"

@interface kitchenOnlineViewController ()

@end

@implementation kitchenOnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createContrallers];
}
-(void)createContrallers{
    NSMutableArray *vcArr=[NSMutableArray array];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Controllers" ofType:@"plist"];
    NSArray *infoArr=[NSArray arrayWithContentsOfFile:path];
    for (NSInteger i=0; i<infoArr.count; i++) {
        Class vcClass=NSClassFromString(infoArr[i][@"vcName"]);
       BaseViewController *vc=[[vcClass alloc]init];
        vc.title=infoArr[i][@"title"];
        vc.navigationController.navigationBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed: @"Background_Bottom_Orange"]];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
        
       
        nav.tabBarItem.image=[UIImage imageNamed: infoArr[i][@"imageName"]];
        [vcArr addObject:nav];
    }
    self.viewControllers=vcArr;
    self.tabBar.backgroundColor=[UIColor blackColor];
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
