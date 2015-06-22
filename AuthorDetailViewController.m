//
//  AuthorDetailViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/19.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "AuthorDetailViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@interface AuthorDetailViewController ()
{
    AFHTTPRequestOperationManager *_manager;
}
@end

@implementation AuthorDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager=[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [self showData];
}
-(void)showData{
    NSLog(@"authordeatailurl:%@",[NSString stringWithFormat:kAuthorDetailUrl,self.frienduid]);
   
    [_manager GET:[NSString stringWithFormat:kAuthorDetailUrl,self.frienduid] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
            [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:kImageUrl,dict[@"pic"]] ] placeholderImage:nil];
            self.author.text=dict[@"title"];
            if ([dict[@"sex"]isEqualToString:@"0"]) {
                self.sex.text=[NSString stringWithFormat:@"女  %@",dict[@"region"]];
            }else{
            self.sex.text=[NSString stringWithFormat:@"男  %@",dict[@"region"]];
            }
            self.fans.text=[NSString stringWithFormat:@"粉丝%@    关注%@",dict[@"fans"],dict[@"follow"]];
            
            [self.collectMenu setTitle:[NSString stringWithFormat:@"%@\n菜谱收藏",dict[@"collection"]] forState:UIControlStateNormal];
            self.collectMenu.titleLabel.numberOfLines=0;
            [self.likes setTitle:[NSString stringWithFormat:@"%@\nTA喜欢的",dict[@"enjoyWeibo"]] forState:UIControlStateNormal];
            self.likes.titleLabel.numberOfLines=0;
            [self.privateKitchen setTitle:[NSString stringWithFormat:@"%@\n私房菜",dict[@"recommend"]] forState:UIControlStateNormal];
            self.privateKitchen.titleLabel.numberOfLines=0;
        if (dict[@"topic"]==nil) {
            [self.topics setTitle:[NSString stringWithFormat:@"0\n话题"] forState:UIControlStateNormal];
        }else{
            [self.topics setTitle:[NSString stringWithFormat:@"%@\n话题",dict[@"topic"]] forState:UIControlStateNormal];
        }
            self.topics.titleLabel.numberOfLines=0;
        self.keyWords.text=dict[@"profile"];
       
        
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"网络下载失败");
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
