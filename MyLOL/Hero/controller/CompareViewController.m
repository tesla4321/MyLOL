//
//  CompareViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/17.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "CompareViewController.h"
#import "UIButton+WebCache.h"
#import "NetHandler.h"
#import "ChooseHeroViewController.h"
#import "UIButton+WebCache.h"
#import "HeroCompareSkillView.h"
@interface CompareViewController ()
@property(nonatomic,strong)HeroCompareSkillView *heroCompareSkillView;
@end

@implementation CompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chooseView = [[ChooseTwoHeroView alloc]initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.bounds.size.height/6))];
    [_chooseView.btn1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfo.hero.enName]] forState:(UIControlStateNormal)];
    [_chooseView.btn2 addTarget:self action:@selector(chooseHero:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.bottomView addSubview:_chooseView];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"属性对比",@"技能对比"]];
    seg.frame = (CGRectMake(0, _chooseView.frame.origin.y + _chooseView.bounds.size.height+20, [UIScreen mainScreen].bounds.size.width, 30));
    seg.selectedSegmentIndex = 0;
    seg.tintColor = [UIColor orangeColor];
    [seg addTarget:self action:@selector(changeCompare:) forControlEvents:(UIControlEventValueChanged)];
    [self.bottomView addSubview:seg];
    
    _heroCompareSkillView = [[HeroCompareSkillView alloc]initWithFrame:(CGRectMake(0, seg.frame.origin.y + 30, KScreenWidth, self.bottomView.bounds.size.height - _chooseView.bounds.size.height - 30 - 20))];
    _heroCompareSkillView.backgroundColor = KImageColor;
    _heroCompareSkillView.heroInfoL = _heroInfo;
    
    [self.bottomView addSubview:_heroCompareSkillView];
    
    _propertyView = [[HeroCompareInfoView alloc]initWithFrame:(CGRectMake(0, seg.frame.origin.y + 30, KScreenWidth, self.bottomView.bounds.size.height - _chooseView.bounds.size.height - 30 - 20 - 30))];
    
    [_propertyView.slider addTarget:self action:@selector(sliderChange:) forControlEvents:(UIControlEventValueChanged)];
    [_propertyView setHeroDetail:_heroInfo WithDegree:1];
    [self.bottomView addSubview:_propertyView];
    
    // Do any additional setup after loading the view.
}

- (void)changeCompare:(UISegmentedControl *)seg{
    switch (seg.selectedSegmentIndex) {
        case 0:
            [self.bottomView bringSubviewToFront:_propertyView];
            break;
        case 1:
            [self.bottomView bringSubviewToFront:_heroCompareSkillView];
            break;
        default:
            break;
    }
}

- (void)chooseHero:(UIButton *)button{
    ChooseHeroViewController *chooseHeroVC = [[ChooseHeroViewController alloc]init];
    
    chooseHeroVC.sendBlock = ^(HeroInformation *heroInfo){
        _heroInfoD = heroInfo;
        _heroCompareSkillView.heroInfoR = _heroInfoD;
        [_propertyView setHeroDetailD:_heroInfoD WithDegree:1];
        [_chooseView.btn2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfoD.hero.enName]] forState:(UIControlStateNormal)];
    };
    [self.navigationController pushViewController:chooseHeroVC animated:1];
    
}




- (void)setHeroInfo:(HeroInformation *)heroInfo{
    _heroInfo = heroInfo;
    
    
}

- (void)sliderChange:(UISlider *)slider{
    [_propertyView setHeroDetail:_heroInfo WithDegree:(NSInteger)slider.value];
    [_propertyView setHeroDetailD:_heroInfoD WithDegree:slider.value];
    
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
