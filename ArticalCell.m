//
//  ArticalCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticalCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
@implementation ArticalCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)showDataWithModel:(ArticleModel*)model{
   
    [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.imageid]] placeholderImage:nil];
    
   
    self.titleLabel.text=model.content;
    NSLog(@"%@",self.titleLabel.text);
    CGRect frame=self.titleLabel.frame;
    frame.origin.y=CGRectGetMaxY(self.image.frame)+5;
    frame.size.height=[LZXHelper textHeightFromTextString:model.content width:self.titleLabel.frame.size.width fontSize:14];
    self.titleLabel.frame=frame;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
