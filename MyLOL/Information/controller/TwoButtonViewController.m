//
//  TwoButtonViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/21.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "TwoButtonViewController.h"
#import "LOLWiKiViewController.h"
#import "NetHandler.h"
#import "ServerModel.h"
#import "LoginViewController.h"
#import "WebViewViewController.h"
@interface TwoButtonViewController ()<UIAlertViewDelegate>

@end

@implementation TwoButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat height = self.bottomView.bounds.size.height;
    UIButton *abilityBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    abilityBtn.frame = CGRectMake(KScreenWidth * 3/8, height/5, KScreenWidth/4, KScreenWidth/4);
    [abilityBtn setTitle:@"战斗力" forState:(UIControlStateNormal)];
    abilityBtn.backgroundColor = [UIColor orangeColor];
    abilityBtn.layer.cornerRadius = 15;
    [abilityBtn addTarget:self action:@selector(abilityAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bottomView addSubview:abilityBtn];
    
    
    UIButton *lolWikiBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    lolWikiBtn.frame = CGRectMake(KScreenWidth * 3/8, height * 3/5, KScreenWidth/4, KScreenWidth/4);
    [lolWikiBtn setTitle:@"lol百科" forState:(UIControlStateNormal)];
    lolWikiBtn.backgroundColor = [UIColor orangeColor];
    lolWikiBtn.layer.cornerRadius = 15;
    [lolWikiBtn addTarget:self action:@selector(lolWikiAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.bottomView addSubview:lolWikiBtn];
    
    [self netparse];
    
    // Do any additional setup after loading the view.
}

- (void)abilityAction:(UIButton *)button{
    
    NSUserDefaults *userDf = [NSUserDefaults standardUserDefaults];
    BOOL isLogin = [userDf boolForKey:@"isLogin"];
    if (isLogin == 1) {
        WebViewViewController *webVC = [[WebViewViewController alloc]init];
        webVC.name = [[NSUserDefaults standardUserDefaults] valueForKey:@"name"];
        webVC.server = [[NSUserDefaults standardUserDefaults] valueForKey:@"server"];
        [self.navigationController pushViewController:webVC animated:1];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"请先登录账号" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        
    }
    
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        loginVC.serverArray = _serverArray;
        [self.navigationController pushViewController:loginVC animated:1];
    }
}

- (void)netparse{
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiServers.php?v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
        _serverArray = [NSMutableArray array];
        NSArray * arr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dic in arr) {
            ServerModel *serverModel = [[ServerModel alloc]init];
            [serverModel setValuesForKeysWithDictionary:dic];
            [_serverArray addObject:serverModel];
        }
        
    }];
    
    
}

- (void)lolWikiAction:(UIButton *)button{
    
    LOLWiKiViewController *lolwikiVC = [[LOLWiKiViewController alloc]init];
    [self.navigationController pushViewController:lolwikiVC animated:1];
    
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
