//
//  LatestCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/15.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "LatestCell.h"
#import "UIImageView+WebCache.h"
@implementation LatestCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)showDataWithModel:(LatestModel*)model{
    self.titleLabel.text=model.title;
    [self.comment setTitle:[NSString stringWithFormat:@"  %@",model.comment.stringValue] forState:UIControlStateNormal];
    self.titleLabel.text=model.nickname;
    self.title2Label.text=model.title;
    self.timeLabel.text=model.addtimeFull;
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.picid]] placeholderImage:nil];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
