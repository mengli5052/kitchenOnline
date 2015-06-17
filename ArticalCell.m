//
//  ArticalCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticalCell.h"
#import "UIImageView+WebCache.h"
@implementation ArticalCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)showDataWithModel:(ArticleModel*)model{
 [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:nil];
    NSLog(@"%@",model.content);
    self.titleLabel.frame=CGRectMake(20, self.frame.size.height-self.image.frame.size.height-5, kScreenSize.width-40, 21);
    self.titleLabel.text=model.content;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
