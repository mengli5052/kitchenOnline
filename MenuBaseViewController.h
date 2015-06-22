//
//  MenuBaseViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/22.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuDetailModel.h"
#import "MenuDetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@interface MenuBaseViewController : UITableViewController
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
}
-(void)downloadDataWithUrl:(NSString *)url;
@end
