//
//  MenuViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuViewController.h"
#import "RecentlyPopularViewController.h"
#import "TheLatestViewController.h"
#import "CommonViewController.h"
#import "MainScrollView.h"
#import "GottalenCell.h"
#define kScreenSize [UIScreen mainScreen].bounds.size
@interface MenuViewController ()
{
    NSArray *_titles;
}
@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addItemWithTitle];
    NSString *path=[[NSBundle mainBundle]pathForResource:@"MenuList" ofType:@"plist"];
    _titles=[NSArray arrayWithContentsOfFile:path];
    //self.navigationItem.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed: @"Background_Bottom_Orange"]];
    [self createHeaderView];
    self.tableView.rowHeight=100;
}
-(void)addItemWithTitle{
    self.navigationController.navigationBar.translucent=NO;
    self.navigationController.navigationBar.backgroundColor=[UIColor orangeColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed: @"Icon_Navbar_Mine"] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIImageView *titleV=[[UIImageView alloc]initWithImage:[UIImage imageNamed: @"Title_eCook"]];
    self.navigationItem.titleView=titleV;
    
    
}
-(void)createHeaderView{
MainScrollView *view=[[[NSBundle mainBundle]loadNibNamed:@"MainScrollView" owner:nil
                                                options:nil]lastObject];
    self.tableView.tableHeaderView=view;
}
-(void)deliver:(UIBarButtonItem*)button{

}
-(void)mineClick{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    NSDictionary *dict=_titles[indexPath.row];
    
    cell.imageView.image=[UIImage imageNamed:dict[@"bigImage"]];
    cell.textLabel.text=dict[@"title"];
    cell.detailTextLabel.text=dict[@"detailTitle"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        RecentlyPopularViewController *recent=[[RecentlyPopularViewController alloc]init];
        recent.navigationItem.title=@"最近流行";
       recent.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:recent animated:YES];
    }else if (indexPath.row==1){
        TheLatestViewController *latest=[[TheLatestViewController alloc]init];
        latest.hidesBottomBarWhenPushed=YES;
        latest.navigationItem.title=@"最新菜谱";
        [self.navigationController pushViewController:latest animated:YES];
    }else{
        CommonViewController *common=[[CommonViewController alloc]init];
        common.hidesBottomBarWhenPushed=YES;
        common.navigationItem.title=@"大家都在做";
        [self.navigationController pushViewController:common animated:YES];
    }
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
