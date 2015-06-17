//
//  ArticleDetailViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import "ArticleModel.h"
#import "AFNetworking.h"
#import "ArticalCell.h"
@interface ArticleDetailViewController ()
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
}
@end

@implementation ArticleDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self downDataWithUrl];
    self.tableView.rowHeight=160;
   
}
-(void)downDataWithUrl{
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *url=[NSString stringWithFormat:kArticalUrl1,self.mid];
    NSLog(@"%@",url);
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        if (responseObject) {
          NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *listArr=dict[@"list"];
           for (NSDictionary *modelDict in listArr) {
                ArticleModel *model=[[ArticleModel alloc]init];
               [model setValuesForKeysWithDictionary:modelDict];
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
    ArticalCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ArticalCell"];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"ArticalCell" owner:nil options:nil]lastObject];
    }
  //http://www.ecook.cn/ecookjson/viewServlet?id=116801&machine=33b9fed4b35973eedef88fb68d619c16&version=10.8.0  id是从当前model的caipuid  这个cell显示的图片需要从上面的url中传过来imageid这个属性;
   ArticleModel *model=_dataArr[indexPath.row];
    [cell showDataWithModel:model];
    return cell;
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
