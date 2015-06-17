//
//  MenuDetailViewController.m
//  kitchenOnline
//
//  Created by qianfeng01 on 15/6/12.
//  Copyright (c) 2015年 张梦丽. All rights reserved.
//

#import "MenuDetailViewController.h"

@interface MenuDetailViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;//网页视图
}
@end

@implementation MenuDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self creatWebView:self.url];
    //[self creatButtonItems];
}
- (void)creatWebView:(NSString *)url{
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height)];
    
    //加载一个请求连接 加载html网页
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [_webView loadRequest:request];
    
    //设置代理 可以获取 开始加载和已经加载结束
    _webView.delegate = self;
    [self.view addSubview:_webView];
}
- (void)creatButtonItems {
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(itemClick:)];
    item1.tag = 101;
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(itemClick:)];
    item2.tag = 102;
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(itemClick:)];
    item3.tag = 103;
    self.navigationItem.rightBarButtonItems = @[item1,item2,item3];
}
- (void)itemClick:(UIBarButtonItem *)item {
    switch (item.tag) {
        case 101://前进
        {
            [_webView goForward];
        }
            break;
        case 102://刷新
        {
            [_webView reload];
        }
            break;
        case 103://后退
        {
            [_webView goBack];
        }
            break;
            
        default:
            break;
    }
}
#pragma mark - 协议的方法
//是否可以加载请求
//将要加载请求的时候调用
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"将要开始加载");
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;//打开菊花
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;//关闭菊花
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"加载失败");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
