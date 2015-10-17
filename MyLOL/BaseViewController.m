//
//  BaseViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/13.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _topView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/8))];
    _topView.image = [UIImage imageNamed:@"main.jpg"];
    _topView.userInteractionEnabled = 1;
    [self.view addSubview:_topView];
    
    _bottomView = [[UIImageView alloc]initWithFrame:(CGRectMake(0,_topView.bounds.size.height, _topView.bounds.size.width, self.view.bounds.size.height - _topView.bounds.size.height))];
    
    _bottomView.image = [UIImage imageNamed:@"huise.jpg"];
    _bottomView.userInteractionEnabled = 1;
    [self.view addSubview:_bottomView];
    
    UIButton *backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    backBtn.frame = CGRectMake(10, _topView.bounds.size.height - 30, 20, 20);
    [backBtn setImage:[UIImage imageNamed:@"small"] forState:(UIControlStateNormal)];
    [backBtn addTarget:self action:@selector(back:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:backBtn];
    
    // Do any additional setup after loading the view.
}

- (void)back:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:1 ];
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
