//
//  ArticalDetailHeaderView.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/18.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "ArticalDetailHeaderView.h"
#import "AuthorDetailViewController.h"
@implementation ArticalDetailHeaderView
-(void)downloadData:(NSString*)mid {
   
    _dataArr=[[NSMutableArray alloc]init];
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSLog(@"%@",[NSString stringWithFormat:kLatesAtticleDetailtUrl,mid]);
    [manager GET:[NSString stringWithFormat:kLatesAtticleDetailtUrl,mid] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",[NSString stringWithFormat:kLatesAtticleDetailtUrl,mid]);
        if (responseObject) {
            NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
           
            LatestModel *model=[[LatestModel alloc]init];
            [model setValuesForKeysWithDictionary:dict];
            [_dataArr addObject:model];
            [self showDataWithModel];//这里有问题,下载的比较快,前面可能没有
            
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
    }];
    
}
-(void)showDataWithModel{
   LatestModel *model=[_dataArr lastObject];
   self.titleLabel.text=model.title;
    [self.authorAndTime setTitle:[NSString stringWithFormat:@"作者:%@  %@",model.nickname,model.addtimeFull]forState:UIControlStateNormal];
      [self.image sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,model.picid]] placeholderImage:nil];
    self.contentLabel.text=model.weibo;
       CGRect frame=self.contentLabel.frame;
    frame.origin.y=CGRectGetMaxY(self.image.frame)+3;
   frame.size.height=[LZXHelper textHeightFromTextString:model.weibo width:self.contentLabel.frame.size.width fontSize:10];
    self.contentLabel.frame=frame;
    NSLog(@"%@",self.contentLabel.text);
  
  
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)setJumpNext:(JumpNextBlock)myBlock{
    _myBlock=myBlock;
}
-(JumpNextBlock)myBlock{
    return _myBlock;
}
- (IBAction)authorAndTimeClick:(id)sender {
    
        if (self.myBlock) {
            self.myBlock();
       
        
    }
}
@end
