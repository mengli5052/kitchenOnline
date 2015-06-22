//
//  BaseViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "BaseViewController.h"
#import "LatestModel.h"
#import "LatestCell.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addItemWithTitle];
   
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)firstInit{
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
   
    
}
-(void)addItemWithTitle{
    //self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed: @"Background_Bottom_Orange"]];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Navbar_Mine"] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIImageView *titleV=[[UIImageView alloc]initWithImage:[UIImage imageNamed: @"Title_eCook"]];
    self.navigationItem.titleView=titleV;
  
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"返回";
    self.navigationItem.backBarButtonItem=backItem;
    
}
-(void)downDataWithUrl:(NSString*)url{
    NSString *urlString=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
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
-(void)mineClick{

}

-(void)downDataWithTarget:(id)target action:(SEL)action{
   

}
#pragma mark - 刷新 这点有问题需要调试;
- (void)creatRefreshView {//在子类中调用 如果不适合子类那么重写
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        if (weakSelf.isRefreshing) {
            return ;
        }
        weakSelf.currentPage = 1;
        weakSelf.isRefreshing = YES;
    }];
    
        [self.tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        //上拉加载更多
        if (weakSelf.isLoadMoring) {
            return ;
        }
        weakSelf.isLoadMoring = YES;
        weakSelf.currentPage++;
        }];
    
    
}
//结束刷新
- (void)endRefreshing {
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [self.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
    }
    if (self.isLoadMoring) {
        self.isLoadMoring = NO;
        [self.tableView footerEndRefreshing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _dataArr.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
