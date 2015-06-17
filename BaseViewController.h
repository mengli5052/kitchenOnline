//
//  BaseViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/11.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseViewController : UITableViewController
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
}
-(void)firstInit;
-(void)addItemWithTitle;
-(void)downDataWithUrl;
@end
