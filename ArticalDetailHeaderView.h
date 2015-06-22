//
//  ArticalDetailHeaderView.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/18.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LatestModel.h"
#import "LZXHelper.h"
#import "AFNetworking.h"
typedef void(^JumpNextBlock)() ;
@interface ArticalDetailHeaderView : UIView
{
 NSMutableArray *_dataArr;
    JumpNextBlock _myBlock;
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *authorAndTime;
- (IBAction)authorAndTimeClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
-(void)showDataWithModel;
-(void)downloadData:(NSString*)mid ;
-(void)setJumpNext:(JumpNextBlock)myBlock;
-(JumpNextBlock)myBlock;
@end
