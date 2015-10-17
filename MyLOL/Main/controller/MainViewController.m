//
//  MainViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/12.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
#import "HeroViewController.h"
@interface MainViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UIImageView *backImageView;
@property(nonatomic,strong)MainView *mainView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = 1;
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2)];
    self.imageView.image = [UIImage imageNamed:@"main2.jpg"];
    [self.view addSubview:_imageView];
    
    self.backImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/2))];
    
    self.backImageView.image = [UIImage imageNamed:@"huise.jpg"];
    [self.view addSubview:_backImageView];
    self.backImageView.userInteractionEnabled = 1;
    

}

- (void)viewWillAppear:(BOOL)animated{
    
    if (_mainView != nil) {
        [_mainView removeFromSuperview];
    }
    
    [super viewWillAppear:animated];
    
    _mainView = [[MainView alloc]initWithFrame:(CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width, self.view.bounds.size.height/2))];
    
    
    [self.view addSubview:_mainView];
    
    
    [_mainView.hero addTarget:self action:@selector(heroAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [_mainView.equip addTarget:self action:@selector(equipAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [_mainView.information addTarget:self action:@selector(informationAction:) forControlEvents:(UIControlEventTouchUpInside)];

}

- (void)heroAction:(UIButton*)button{
//    HeroViewController *heroVC = [[HeroViewController alloc]init];
//    
//    [UIView transitionFromView:self.view toView:heroVC.view duration:0.5 options:(UIViewAnimationOptionTransitionCurlUp) completion:nil];
//    
//    [self addChildViewController:heroVC];
    
    HeroViewController *heroVC = [[HeroViewController alloc]init];
    [self.navigationController pushViewController:heroVC animated:1];
    
}



- (void)equipAction:(UIButton *)button{
    
}

- (void)informationAction:(UIButton *)button{
    
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
