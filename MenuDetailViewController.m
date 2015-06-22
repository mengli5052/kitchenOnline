//
//  MenuDetailViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuDetailViewController.h"
#import "AFNetworking.h"
#import "MenuDetailModel.h"
#import "MaterialListModel.h"
#import "StepListModel.h"
#import "ADView.h"
#import "LZXHelper.h"
#import "HeaderView.h"
@interface MenuDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
    NSMutableArray *_materialListArr;
    NSMutableArray *_stepListArr;
    NSMutableArray *_modelArr;
    UITableView *_tableView;
}
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation MenuDetailViewController
-(void)setMyBlock:(ImageIdBlock)myBlock{
    _myBlock=myBlock;
}
-(ImageIdBlock)myBlock{
    return _myBlock;
}
- (void)viewDidLoad {

    [super viewDidLoad];
    [self firstInit];
    [self createTableView];
    [self downDataWithUrl];
    [self createHeaderView];
    
    }
-(void)firstInit{
    _dataArr=[[NSMutableArray alloc]init];
    _materialListArr=[[NSMutableArray alloc]init];
    _stepListArr=[[NSMutableArray alloc]init];
    _modelArr=[[NSMutableArray alloc]init];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    self.automaticallyAdjustsScrollViewInsets = YES;
}
-(void)createTableView{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) style:UITableViewStyleGrouped];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}
-(void)downDataWithUrl{
    
    NSString *url=[NSString stringWithFormat:kMenuDetailUrl,self.cid];
    NSLog(@"menuDetail:%@",url);
    [_manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        if (responseObject) {
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            MenuDetailModel *model=[[MenuDetailModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            NSLog(@"%@",model);
            
            NSArray *materialList=model.materialList;
            for (NSDictionary *modelDict in materialList) {
                MaterialListModel *model=[[MaterialListModel alloc]init];
                [model setValuesForKeysWithDictionary:modelDict];
                [_materialListArr addObject:model];
            }
            [_dataArr addObject:_materialListArr];
            NSArray *stepList=model.stepList;
           
            for (NSDictionary *stepDict in stepList) {
                StepListModel *model=[[StepListModel alloc]init];
                [model setValuesForKeysWithDictionary:stepDict];
                [_stepListArr addObject:model];
            }
            [_dataArr addObject:_stepListArr];
            NSLog(@"%@",dict[@"imageid"]);
//            if (self.myBlock) {
//                self.myBlock(dict[@"imageid"]);
//            }
            [_modelArr addObject:model];
           [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络下载失败");
    }];
    }

-(void)createHeaderView{
    HeaderView*view=[[[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:nil options:nil]lastObject];
    [view showDataWithModel:[_modelArr lastObject]];
    self.tableView.tableHeaderView=view;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArr[section] count];
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1  reuseIdentifier:@"Cell"];
    }
    
    if (indexPath.section==0) {
       
        MaterialListModel *model=_dataArr[indexPath.section][indexPath.row];
        
            cell.textLabel.text=model.name;
            cell.detailTextLabel.text=model.dosage;
        cell.textLabel.font=[UIFont systemFontOfSize:14];
        cell.detailTextLabel.font=[UIFont systemFontOfSize:13];
            cell.detailTextLabel.textColor=[UIColor orangeColor];
            
        
    }else{
       
        StepListModel *model=_dataArr[indexPath.section][indexPath.row];
        cell.textLabel.text=model.details;
        cell.textLabel.font=[UIFont systemFontOfSize:12];
         CGFloat height=[LZXHelper textHeightFromTextString:model.details width:kScreenSize.width fontSize:12];
        CGRect frame=cell.frame;
       frame.size.height=height;
        cell.frame=frame;
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height=5;
    if (indexPath.section==0) {
        MaterialListModel *model=_dataArr[indexPath.section][indexPath.row];
        height+=[LZXHelper textHeightFromTextString:model.dosage width:kScreenSize.width fontSize:12];
    }
    if (indexPath.section==1) {
        StepListModel *model=_dataArr[indexPath.section][indexPath.row];
        height+=[LZXHelper textHeightFromTextString:model.details width:kScreenSize.width fontSize:12];
    }
  
    height+=5;
    return height;
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
