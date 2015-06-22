//
//  MainScrollView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/18.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MainScrollView.h"
#import "UIImageView+WebCache.h"
@implementation MainScrollView

- (void)showDataWithModel:(dailyMenuModel *)model{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"MainScrollView" ofType:@"plist"];
    NSArray *arr=[[NSArray alloc]initWithContentsOfFile:path];
    for (NSInteger i=0; i<arr.count; i++) {
        NSDictionary *dict=arr[i];
        self.iconImage.image=[UIImage imageNamed:dict[@"iconName"]];
        self.timeLabel.text=dict[@"titleLabel"];
        self.contentLabel.text=dict[@"contentLabel"];
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:nil];
        
                              
    }
}

@end
