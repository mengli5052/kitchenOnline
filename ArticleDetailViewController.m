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
#import "MenuDetailViewController.h"
#import "ArticalOneCell.h"
#import "LZXHelper.h"
#import "ArticalDetailHeaderView.h"
#import "AuthorDetailViewController.h"
@interface ArticleDetailViewController ()
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
    MenuDetailViewController *_menu;
}
@end

@implementation ArticleDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self downDataWithUrl];
    self.tableView.rowHeight=120;
       [self creatHeaderView];
    //[self createToolBar];
   
}
-(void)setChangeTotalValueBlock:(ChangeTotalValueBlock)myBlock{
    _block=myBlock;
}
-(ChangeTotalValueBlock)myBlock{
    return _block;
}
-(void)viewWillAppear:(BOOL)animated{
    _menu=[[MenuDetailViewController alloc]init];
    __weak typeof(self) weakSelf=self;
 [_menu setMyBlock:^(NSString *imageId) {
     weakSelf.imageId=imageId;
 }];
    NSLog(@"%@",weakSelf.imageId);
}
-(void)creatHeaderView{
    __weak typeof(self)weakSelf=self;
  ArticalDetailHeaderView*view=[[[NSBundle mainBundle]loadNibNamed:@"ArticalDetailHeaderView" owner:nil options:nil]lastObject];
    [view downloadData:self.mid];
    CGRect frame=self.tableView.tableHeaderView.frame;
    frame.size.height=view.contentLabel.frame.size.height+view.titleLabel.frame.size.height+view.image.frame.size.height+view.authorAndTime.frame.size.height;
    self.tableView.tableHeaderView.frame=frame;
    NSLog(@"uid:%@",self.uid);
    
    [view setJumpNext:^(NSMutableArray *dataArr) {
        NSLog(@"uid:%@",self.uid);
        if (self.uid!=nil) {
            AuthorDetailViewController *author=[[AuthorDetailViewController alloc]init];
            author.frienduid=self.uid;
            author.hidesBottomBarWhenPushed=YES;
            [weakSelf.navigationController pushViewController:author animated:YES];
        }
    }];
    self.tableView.tableHeaderView=view;
   
     NSLog(@"tableheaderviewheight:%f",self.tableView.tableHeaderView.frame.size.height);
  
 
}
//-(void)createToolBar{
//    [self.navigationController setToolbarHidden:NO animated:YES];
//    NSMutableArray *arr=[[NSMutableArray alloc]init];
//    self.navigationController.toolbar.backgroundColor=[UIColor blackColor];
//    UIBarButtonItem *flex=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:@selector(flexClick)];
//    [arr addObject:flex];
//   
//    
//    UIBarButtonItem *share=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Bottom_Forward" ] style:UIBarButtonItemStylePlain target:self action:@selector(shareClick:)];
//    [arr addObject:share];
//    [arr addObject:flex];
//    UIBarButtonItem *comment=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Bottom_Comment" ] style:UIBarButtonItemStylePlain target:self action:@selector(commentClick:)];
//    [arr addObject:comment];
//    UIBarButtonItem *forward=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Bottom_Forward"] style:UIBarButtonItemStylePlain target:self action:@selector(forwardClick:)];
//    [arr addObject:forward];
//    [arr addObject:flex];
//    self.toolbarItems=arr;
//}
//-(void)shareClick:(UIBarButtonItem*)item{
//    NSString *key = self.mid;
//    BOOL isLike = [[NSUserDefaults standardUserDefaults] boolForKey:key];
//    if (isLike) {
//        //弹出一个警告框表示已经点过了
//        //return;
//    }
//    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:key];
//    //同步到磁盘
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    if (self.myBlock) {
//        self.myBlock(self.total);
//    }
//    [item setBackgroundImage:[UIImage imageNamed: @"Icon_Bottom_Loved"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];//表示选中  点过赞了
//    //记录+1
//    //self.model.likes = [NSString stringWithFormat:@"%ld",self.model.likes.integerValue+1];
//    //改标题
//  
//    
//    //作弊 1000次
//    
//        
////        [manager POST:kZanUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
////            NSDictionary *downDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
////            NSLog(@"downDict:%@",downDict);
////            
////        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////            NSLog(@"失败");
////        }];
////        
////
//
//}
//-(void)commentClick:(UIBarButtonItem*)item{
//    
//}
//-(void)forwardClick:(UIBarButtonItem*)item{
//    
//}
//-(void)flexClick{
//
//}
-(void)downDataWithUrl{
    __weak typeof(self) weakSelf=self;
    _dataArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *url=[NSString stringWithFormat:kArticalUrl1,self.mid];
    NSLog(@"art:%@",url);
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        if (responseObject) {
          NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSArray *listArr=dict[@"list"];
           for (NSDictionary *modelDict in listArr) {
                ArticleModel *model=[[ArticleModel alloc]init];
               [model setValuesForKeysWithDictionary:modelDict];
               self.uid=model.uid;
               self.total=model.total;
                [_dataArr addObject:model];
                }
            [_menu setMyBlock:^(NSString *imageId) {
                weakSelf.imageId=imageId;
            }];
           
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
     ArticleModel *model=_dataArr[indexPath.row];
   
    if ([model.musername isEqualToString:self.musername]) {
       
        ArticalCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ArticalCell"];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"ArticalCell" owner:nil options:nil]lastObject] ;
        }
        [cell showDataWithModel:model];
        return cell;
        
    } else {
                 ArticalOneCell *cell=[tableView dequeueReusableCellWithIdentifier:@"ArticalOneCell"];
        if (cell==nil) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"ArticalOneCell" owner:nil options:nil]lastObject] ;
        }
        [cell displayDataWithModel:model];
         NSLog(@"%s %d",__func__,__LINE__);
        return cell;
    }
   
//id是从当前model的caipuid  这个cell显示的图片需要从上面的url中传过来imageid这个属性;
  
    
   // return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ArticleModel *model=_dataArr[indexPath.row];
    if (![model.caipuid isEqualToString:@""]) {
       _menu.cid=model.caipuid;
        UIBarButtonItem *item=[[UIBarButtonItem alloc]init];
        item.title=@"返回";
        _menu.navigationItem.backBarButtonItem=item;
        _menu.navigationItem.title=@"菜谱详情";
        
      [self.navigationController pushViewController:_menu animated:YES];
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height=160;
    ArticleModel *model=_dataArr[indexPath.row];
//    if ([model.mid isEqualToString:self.mid]) {
//        ArticalCell *cell=(ArticalCell*)[tableView cellForRowAtIndexPath:indexPath];
//        height+=CGRectGetMaxY(cell.image.frame);
//        CGRect frame=cell.titleLabel.frame;
//        frame.size.height=[LZXHelper textHeightFromTextString:cell.titleLabel.text width:cell.titleLabel.frame.size.width fontSize:10];
//        height+=frame.size.height;
//        
//    }
    //else {
//        ArticalOneCell *cell=(ArticalOneCell*)[tableView cellForRowAtIndexPath:indexPath];
//     
//        CGRect frame1=cell.contentLabel.frame;
//        if (model.pic.length) {
//        CGRect frame=cell.imageView.frame;
//        cell.imageView.hidden=NO;
//        frame.origin.y=CGRectGetMaxY(cell.displayName.frame);
//        height+=100;
//        frame1.origin.y=CGRectGetMaxY(cell.imageView.frame);
//        frame1.size.height=[LZXHelper textHeightFromTextString:model.content width:cell.contentLabel.frame.size.width fontSize:10];
//        height+=frame1.size.height;
//            
//        }
//        height+=frame1.size.height;
//       
//      
//    }

   // NSLog(@"cell height:%f",height);
    
    return height;
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
