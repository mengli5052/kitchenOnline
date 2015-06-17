//
//  MenuDetailViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^ImageIdBlock) (NSString *imageId);
@interface MenuDetailViewController : BaseViewController
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)ImageIdBlock myBlock;
@end
