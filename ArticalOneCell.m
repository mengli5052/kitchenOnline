//
//  ArticalOneCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/16.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticalOneCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
@implementation ArticalOneCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)displayDataWithModel:(ArticleModel*)model{
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.pic]] placeholderImage:nil];
    self.username.text=model.musername;
    self.displayName.text=model.dateline;
    self.contentLabel.text=model.content;
    CGRect frame=self.contentLabel.frame;
    frame.size.height=[LZXHelper textHeightFromTextString:model.content width:self.contentLabel.frame.size.width fontSize:12];
    self.contentLabel.frame=frame;
    self.imageView.hidden=YES;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,nil]] placeholderImage:nil];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
