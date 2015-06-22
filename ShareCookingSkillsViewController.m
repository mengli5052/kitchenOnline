//
//  ShareCookingSkillsViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ShareCookingSkillsViewController.h"
#import "LatestModel.h"
#import "LatestCell.h"
#import "MyControl.h"
#import "LatestViewController.h"
#import "Essence postViewController.h"
#import "ShareSkillView.h"
#import "GottalentViewController.h"
#import "FollowViewController.h"
#import "ArticleDetailViewController.h"
#import "LatestModel.h"
@interface ShareCookingSkillsViewController ()

@end

@implementation ShareCookingSkillsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.automaticallyAdjustsScrollViewInsets=YES;
    [self.navigationItem.rightBarButtonItem setBackgroundImage:[UIImage imageNamed: @"Icon_Navbar_Deliver"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self firstInit];
    [self addItemWithTitle];
     [self createHeaderView];
    [self downDataWithUrl:kLatestUrl];
    self.tableView.rowHeight=120;
   
   
}

-(void)createHeaderView{
    __weak typeof(self)weakSelf=self;
    ShareSkillView *view=[[[NSBundle mainBundle]loadNibNamed:@"ShareSkillView" owner:nil options:nil]lastObject];
    CGRect frame=view.frame;
    frame.size.height=41;
    view.frame=frame;
    [view setLatestBlock:^{
        LatestViewController *laest=[[LatestViewController alloc]init];
        laest.navigationItem.title=@"最新";
        laest.hidesBottomBarWhenPushed=YES;
        [weakSelf.navigationController pushViewController:laest animated:YES];
    }];
    [view setBrillianceBlock:^{
        Essence_postViewController *essence=[[Essence_postViewController alloc]init];
       
         essence.navigationItem.title=@"精华帖";
       essence.hidesBottomBarWhenPushed=YES;
        [weakSelf.navigationController pushViewController:essence animated:YES];
    }];
    [view setGottalenBlock:^{
        GottalentViewController *gottalent=[[GottalentViewController alloc]init];
         gottalent.navigationItem.title=@"达人推荐";
        gottalent.hidesBottomBarWhenPushed=YES;
        [weakSelf.navigationController pushViewController:gottalent animated:YES];
    }];
    [view setTopicBlock:^{
        FollowViewController *follow=[[FollowViewController alloc]init];
        follow.navigationItem.title=@"关注的人";
       follow.hidesBottomBarWhenPushed=YES;
        [weakSelf.navigationController pushViewController:follow animated:YES];
    }];
    [self.tableView setTableHeaderView:view];

    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LatestModel *model=_dataArr[indexPath.row];
    ArticleDetailViewController *article=[[ArticleDetailViewController alloc]init];
    article.mid=model.id;
    NSLog(@"article.mid:%@",article.mid);
    [self.navigationController pushViewController:article animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
