//
//  SharBaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/20.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "SharBaseViewController.h"
#import "ArticleDetailViewController.h"
@interface SharBaseViewController ()

@end

@implementation SharBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=120;
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer  serializer];
    // Do any additional setup after loading the view.
}
-(void)downloadDataWithUrl:(NSString*)url{
  
    NSString *urlString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"urlString:%@",urlString);
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
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
