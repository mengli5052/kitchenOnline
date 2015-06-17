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
#import "Essence postViewController.h"
#import "LatestViewController.h"
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
    [self downDataWithUrl];
    self.tableView.rowHeight=120;
   
   
}
-(void)createHeaderView{
    NSArray *titles=@[@"精华帖",@"最新",@"关注的人",@"达人推荐",@"更多",];
    NSArray *imageNames=@[@"Icon_Topic_Brilliance",@"Icon_Topic_Latest",@"Icon_Topic_Follow",@"Icon_Topic_Gottalent",@"Icon_Topic_More"];
    CGFloat spcing=10;
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 73)];
    // backView.backgroundColor=[UIColor blackColor];
    for (NSInteger i=0; i<5; i++) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(spcing+((kScreenSize.width-6*spcing)/5+spcing)*i, 0, (kScreenSize.width-6*spcing)/5, 73);
       button.tag=101+i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:12];
        button.titleLabel.textColor=[UIColor blackColor];
        button.imageView.image=[UIImage imageNamed:imageNames[i]];
        [button addTarget:self action:@selector(jumpNext:) forControlEvents:UIControlEventTouchUpInside];
//       [button setImageEdgeInsets:UIEdgeInsetsMake(-20, 0, button.frame.size.height-10-33, 0)];//上左底右
//       
//        [button setTitleEdgeInsets:UIEdgeInsetsMake(30, 0, 0, 0)];
        
        [backView addSubview:button];
        
    }
   
    self.tableView.tableHeaderView=backView;
    
}

-(void)downDataWithUrl{
 
   NSString *urlString = [kLatestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        if (responseObject) {
            NSLog(@"%@",kLatestUrl);
             NSLog(@"%s  %d",__func__,__LINE__);
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *listArr=dict[@"list"];
            for (NSDictionary *dict in listArr) {
               LatestModel *model=[[LatestModel alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [_dataArr addObject:model];
              
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络下载失败");
    }];
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LatestCell *cell=[tableView dequeueReusableCellWithIdentifier:@"LatestCell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"LatestCell" owner:nil options:nil]lastObject];
    }
    LatestModel *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}

-(void)jumpNext:(UIButton*)button{
    switch (button.tag) {
        case 101:
        {
            Essence_postViewController *essence=[[Essence_postViewController alloc]init];
            [self.navigationController pushViewController:essence animated:YES];
        }
            break;
        case 102:
        {
            LatestViewController *latest=[[LatestViewController alloc]init];
            [self.navigationController pushViewController:latest animated:YES];
        }
            break;
        case 103:
        {
            
        }
            break;
        case 104:
        {
            
        }
            break;
        case 105:
        {
            
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
