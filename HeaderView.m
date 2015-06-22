//
//  HeaderView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/17.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "HeaderView.h"
#import "UIImageView+WebCache.h"
@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)showDataWithModel:(MenuDetailModel *)model{
    NSLog(@"menudetail:%@",model.imageid);
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:nil];
    [self.shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [self.upLoadButton setTitle:@"上传我做的" forState:UIControlStateNormal];
    [self.menuButton setTitle:@"菜单" forState:UIControlStateNormal];
    [self.collectButton setTitle:@"收集" forState:UIControlStateNormal];
    [self.shareButton setTitleEdgeInsets:UIEdgeInsetsMake(self.shareButton.imageView.frame.size.height+10, 0, 0, 0)];
    
    
    
}
- (IBAction)sharClick:(id)sender {
}

- (IBAction)uploadClick:(id)sender {
}

- (IBAction)menuClick:(id)sender {
}

- (IBAction)collectClick:(id)sender {
}
@end
