//
//  MainViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MainViewController.h"
#import "AFNetworking.h"
#import "Model.h"
#import "RecommendCell.h"
#import "MyControl.h"
#import "dailyMenuModel.h"
#import "LZXHelper.h"
#import "ArticleDetailViewController.h"
@interface MainViewController ()
{
    NSMutableArray *_dailyMenuPoList;
    NSMutableArray *_onTop;
}
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self firstInit];
    _dailyMenuPoList=[[NSMutableArray alloc]init];
    _onTop=[[NSMutableArray alloc]init];
    self.tableView.rowHeight=100;
    [self downDataWithUrl];
    
    
  
}
-(void)downDataWithUrl{
    
    [_manager GET:kFirstUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        if (responseObject) {
            NSDictionary *recommend=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *recommendArr=recommend[@"recommendUris"];
            NSArray *daily=recommend[@"dailyMenuPoList"];
            NSArray *onTop=recommend[@"ontop"];
           for (NSDictionary *dict in onTop) {
             NSString *imageurl=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
              [_onTop addObject:imageurl];
           }
            ADView *view=[[ADView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 180) imageUrl:_onTop];
            self.tableView.tableHeaderView=view;
            [self.tableView reloadData];
            for (NSDictionary *dict in daily) {
                dailyMenuModel *model=[[dailyMenuModel alloc]init];
                model.type=dict[@"type"];
                model.imageid=[NSString stringWithFormat:kImageUrl,dict[@"imageid"]];
                  model.id=dict[@"id"];
                model.name=dict[@"name"];
                [_dailyMenuPoList addObject:model];
            }
            
            for (NSDictionary *dict in recommendArr) {
                Model *model=[[Model alloc]init];
                [model setValuesForKeysWithDictionary:dict];
                [_dataArr addObject:model];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络下载失败");
    }];
    
}
-(void)createHeaderView:(NSArray *)imageUrl{
   ADView *view=[[ADView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 60) imageUrl:imageUrl];
    self.tableView.tableHeaderView=view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"RecommendCell" owner:nil options:nil]lastObject];
    }
    Model *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
}
//-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//  
//    
//    
//    
//    return view;
//}
-(void)createDailiyView :(NSString*)title support:(NSString*)supportStr imageName:(NSString*)imageName{
  

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   ArticleDetailViewController *article=[[ArticleDetailViewController alloc]init];
    Model *model=_dataArr[indexPath.row];
    NSArray *arr=[model.uri componentsSeparatedByString:@"?"];
    NSArray *arr2=[arr[1] componentsSeparatedByString:@"="];
    NSString *uid=[arr2 lastObject];
    article.mid=uid;
    article.musername=model.author;
    article.navigationItem.title=@"全部";
    article.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:article animated:YES];
    self.navigationController.toolbar.hidden=YES;
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
