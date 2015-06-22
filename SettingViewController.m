//
//  SettingViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/21.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
{
    NSMutableArray *_dataArr;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor purpleColor];
    _dataArr=[[NSMutableArray alloc]init];
    self.tableView.backgroundColor=[UIColor purpleColor];
    NSArray *titles=@[@"每日签到"];
    [_dataArr addObject:titles];
    NSArray *titles1=@[@"清除缓存",@"小厨说",@"检查更新"];
    [_dataArr addObject:titles1];
    NSLog(@"%@",_dataArr);
    NSLog(@"%s %d",__func__,__LINE__);
    
}
-(void)viewDidAppear:(BOOL)animated{
     NSLog(@"%s %d",__func__,__LINE__);
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,kScreenSize.width, kScreenSize.height) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor=[UIColor purpleColor];
     NSLog(@"%s %d",__func__,__LINE__);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
  
     NSLog(@"%s %d",__func__,__LINE__);
    return   _dataArr.count;
;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    NSLog(@"%s %d",__func__,__LINE__);
    return [_dataArr[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     NSLog(@"%s %d",__func__,__LINE__);
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
 if (cell==nil) {
 cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
 }
 cell.textLabel.text=_dataArr[indexPath.section][indexPath.row];
    NSLog(@"%@",cell.textLabel.text);
  NSLog(@"%s %d",__func__,__LINE__);
 return cell;
}


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
