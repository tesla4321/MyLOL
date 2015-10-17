//
//  HeroInformationViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroInformationViewController.h"
#import "TopView.h"
#import "UIImageView+WebCache.h"
#import "DataView.h"

#import "NetHandler.h"
@interface HeroInformationViewController ()
@property(nonatomic,strong)TopView *heroInfoTopView;

@end

@implementation HeroInformationViewController



- (void)setHeroInfomation:(HeroInformation *)heroInfomation{
    
    _heroInfomation = heroInfomation;
    [_heroInfoTopView.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfomation.hero.enName]] placeholderImage:[UIImage imageNamed:@"1"]];
    _heroInfoTopView.nameLabel.text = _heroInfomation.hero.cnName;
    NSArray *priceArr = [_heroInfomation.hero.price componentsSeparatedByString:@","];
    _heroInfoTopView.priceLabel.text = [NSString stringWithFormat:@"金: %@券: %@",priceArr[0],priceArr[1]];
    
    NSArray *ratingArr = [_heroInfomation.hero.rating componentsSeparatedByString:@","];
    _heroInfoTopView.characterLabel.text = [NSString stringWithFormat:@"攻:%@:防%@法:%@难度:%@",ratingArr[0],ratingArr[1],ratingArr[2],ratingArr[3]];
    _dataView.heroInformation = heroInfomation;
//    [_dataView.tabelView reloadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _heroInfoTopView = [[TopView alloc]initWithFrame:(CGRectMake(0, self.topView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height/6))];
    [self.view addSubview:_heroInfoTopView];
    
    //segmented
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"资料",@"出装"]];
    seg.frame = CGRectMake(0, _heroInfoTopView.frame.origin.y + _heroInfoTopView.bounds.size.height, self.view.bounds.size.width, 30);
    seg.tintColor = [UIColor orangeColor];
    seg.selectedSegmentIndex = 0;
    [seg addTarget:self action:@selector(displayChange:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:seg];
    
    
    _equipview = [[EquipmentView alloc]initWithFrame:(CGRectMake(0, seg.bounds.size.height + _heroInfoTopView.bounds.size.height, self.view.bounds.size.width, self.bottomView.bounds.size.height - seg.bounds.size.height - _heroInfoTopView.bounds.size.height))];
    _equipview.tag = 4001;
    [self.bottomView addSubview:_equipview];
    
    
    _dataView = [[DataView alloc]initWithFrame:(CGRectMake(0, seg.bounds.size.height + _heroInfoTopView.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - seg.bounds.size.height - seg.frame.origin.y))];
    _dataView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    _dataView.tag = 4000;
    [self.bottomView addSubview:_dataView];
    // Do any additional setup after loading the view.
}

- (void)displayChange:(UISegmentedControl *)seg{
    [self.bottomView bringSubviewToFront:[self.bottomView viewWithTag:seg.selectedSegmentIndex + 4000]];
    
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
