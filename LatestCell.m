//
//  LatestCell.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/15.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "LatestCell.h"
#import "UIImageView+WebCache.h"
#import "LZXHelper.h"
@implementation LatestCell

- (void)awakeFromNib {
    self.iconImage.layer.masksToBounds=YES;
    self.iconImage.layer.cornerRadius=5;
}
-(void)showDataWithModel:(LatestModel*)model{
    self.titleLabel.text=model.title;
 
    [self.comment setTitle:[NSString stringWithFormat:@"  %@",model.comment.stringValue] forState:UIControlStateNormal];
    if ([model.enjoy.stringValue isEqualToString:@"0"]||[model.forward.stringValue isEqualToString:@"0"]) {
        self.enjoyButton.hidden=YES;
        self.forwordButton.hidden=YES;
    }else{
    [self.enjoyButton setTitle:[NSString stringWithFormat:@" %@",model.enjoy.stringValue] forState:UIControlStateNormal];
        [self.forwordButton setTitle:[NSString stringWithFormat:@" %@",model.forward.stringValue] forState:UIControlStateNormal];
    }
    
     [self.forwordButton setTitle:[NSString stringWithFormat:@"  %@",model.forward.stringValue] forState:UIControlStateNormal];
    NSString *timestr=[LZXHelper stringNowToDate:model.addtimeFull formater:nil];
    NSLog(@"%@",timestr);
   // NSArray *arr=[timestr componentsSeparatedByString:@":"];
    if (([timestr substringToIndex:2].intValue/24)/30>=1) {
        self.timeLabel.text=[NSString stringWithFormat:@"发表:%d月前",[timestr substringToIndex:2].intValue/24/30];
    }else if ([timestr substringToIndex:2].intValue/24>=1&&[timestr substringToIndex:2].intValue/24<30){
    self.timeLabel.text=[NSString stringWithFormat:@"发表:%d天前",[timestr substringToIndex:2].intValue/24];
    }else if ([timestr substringToIndex:2].intValue/24<1){
     self.timeLabel.text=[NSString stringWithFormat:@"发表:%d小时前",[timestr substringToIndex:2].intValue];
    }else if ([timestr substringToIndex:2].intValue<1&&[timestr substringWithRange:NSMakeRange(3, 2)].intValue){
     self.timeLabel.text=[NSString stringWithFormat:@"发表:%d分钟前",[timestr substringWithRange:NSMakeRange(3, 2)].intValue];
    }
    
    self.titleLabel.text=model.nickname;
    self.title2Label.text=model.title;
 
  
    self.timeLabel.text=model.addtimeFull;
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.picid]] placeholderImage:[UIImage imageNamed: @"qzone"]];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
