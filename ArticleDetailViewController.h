//
//  ArticleDetailViewController.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "BaseViewController.h"
typedef void(^ChangeTotalValueBlock) (NSString* total);

@interface ArticleDetailViewController : UITableViewController
{
    ChangeTotalValueBlock _block;
}
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *imageId;
@property(nonatomic,copy)NSString *uid;
@property(nonatomic,copy)NSString *musername;
@property(nonatomic,copy)NSString *total;
-(void)setChangeTotalValueBlock:(ChangeTotalValueBlock)myBlock;
-(ChangeTotalValueBlock)myBlock;
@end
