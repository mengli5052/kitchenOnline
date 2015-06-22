//
//  MainScrollView.h
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/18.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dailyMenuModel.h"
@interface MainScrollView : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *parentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
-(void)showDataWithModel:(dailyMenuModel*)model;

@end
