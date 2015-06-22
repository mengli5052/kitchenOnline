//
//  ShareSkillView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/19.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ShareSkillView.h"

@implementation ShareSkillView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setBrillianceBlock:(JumpBrillianceBlock)myBlock{
    _brilliance=myBlock;
}
-(JumpBrillianceBlock)myBlock{
    return _brilliance;
}
-(void)setLatestBlock:(JumpLatestBlock)latestBlock{
    _latest=latestBlock;
}
-(JumpLatestBlock)latestBlock{
    return _latest;
}
-(void)setTopicBlock:(JumpTopicBlock)topicBlock{
    _topic=topicBlock;
}
-(JumpTopicBlock)topicBlock{
    return _topic;
}
-(void)setGottalenBlock:(JumpGottalentBlock)gottalenBlock{
    _gottalent=gottalenBlock;
}
-(JumpGottalentBlock)gottalenBlock{
    return _gottalent;
}
- (IBAction)brillanceClick:(id)sender {
    if (self.myBlock) {
        self.myBlock();
    }
}

- (IBAction)latestClick:(id)sender {
    if (self.latestBlock) {
        self.latestBlock();
    }
}

- (IBAction)topicClick:(id)sender {
    if (self.topicBlock) {
        self.topicBlock();
    }
}

- (IBAction)gottalentClick:(id)sender {
    if (self.gottalenBlock) {
        self.gottalenBlock();
    }
}
-(void)showButton{
    [self.brillanceButton setTitle:@"精华帖" forState:UIControlStateNormal];
    [self.brillanceButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.brillanceButton setTitleEdgeInsets:UIEdgeInsetsMake(self.brillanceButton.imageView.frame.size.height+5, 0, 0, 0)];
}
@end
