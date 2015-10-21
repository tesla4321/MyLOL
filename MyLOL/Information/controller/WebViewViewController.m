//
//  WebViewViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/21.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()<UIWebViewDelegate>

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:(CGRectMake(0, 0, KScreenWidth, self.bottomView.bounds.size.height))];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[[NSString stringWithFormat:@"http://zdl.mbox.duowan.com/phone/playerDetailNew.php?sn=%@&target=%@&v=70&OSType=iOS8.1.2&versionName=2.1.4",self.server,self.name] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
    webView.delegate = self;
    [webView loadRequest:request];
    
    [webView reload];
    
    
    
    UIButton *cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    cancelBtn.frame = CGRectMake(KScreenWidth - 80, self.topView.bounds.size.height - 40, 70, 30);
    [cancelBtn setTitle:@"注销" forState:(UIControlStateNormal)];
    [cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    [self.bottomView addSubview:webView];
    [self.topView addSubview:cancelBtn];
    // Do any additional setup after loading the view.
}

- (void)cancelAction:(UIButton *)button{
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    [userDf setBool:0 forKey:@"isLogin"];
    [userDf synchronize];
    [self.navigationController popViewControllerAnimated:1];
    
    
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%@",error);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [[NSUserDefaults standardUserDefaults] setBool:1 forKey:@"isLogin"];
    [[NSUserDefaults standardUserDefaults] setValue:self.name forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setValue:self.server forKey:@"server"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
