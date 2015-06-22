//
//  MenuBaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/22.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuBaseViewController.h"

@interface MenuBaseViewController ()

@end

@implementation MenuBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=90;
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer  serializer];
}
-(void)downloadDataWithUrl:(NSString *)url{
    NSLog(@"%@",url);
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *listArr=dict[@"list"];
        
        NSString *str=nil;
        
        str=[listArr componentsJoinedByString:@","];
        NSLog(@"str:%@",str);
        NSString *recentPopularUrl=nil;
        if ([url isEqualToString:kCommonUrl]) {
             recentPopularUrl=[[NSString stringWithFormat:kCommonUrl1,str]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }else if ([url isEqualToString:kTheLatestUrl]){
         recentPopularUrl=[[NSString stringWithFormat:kTheLatestUrl1,str]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }else{
         recentPopularUrl=[[NSString stringWithFormat:kRecentPopularUrl1,str]stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
      
        NSLog(@"%@",recentPopularUrl);
        AFHTTPRequestOperationManager *manager1=[AFHTTPRequestOperationManager manager];
        manager1.responseSerializer=[AFHTTPResponseSerializer serializer];
        [manager1  GET:recentPopularUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"下载成功");
            NSLog(@"url:%@",recentPopularUrl);
            NSDictionary *dict1=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
   
            
            NSArray *listArr1=dict1[@"list"];
            NSLog(@"%@",listArr);
            for (NSDictionary *modelDict in listArr1) {
                MenuDetailModel *model=[[MenuDetailModel alloc]init];
                [model setValuesForKeysWithDictionary:modelDict];
                
                [_dataArr addObject:model];
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"下载失败");
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    MenuDetailModel *model=_dataArr[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:[UIImage imageNamed: @"qzone"]];
    cell.textLabel.text=model.name;
    cell.detailTextLabel.text=model.content;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuDetailModel *model=_dataArr[indexPath.row];
    MenuDetailViewController *menu=[[MenuDetailViewController alloc]init];
    menu.cid=model.id;
    [self.navigationController pushViewController:menu animated:YES];
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
