//
//  LatestViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/13.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "LatestViewController.h"
#import "LatestModel.h"
#import "LatestCell.h"
@interface LatestViewController ()

@end

@implementation LatestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downDataWithUrl];
}
-(void)downDataWithUrl{
    
    NSString *urlString = [kLatestUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [_manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        if (responseObject) {
           
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
