//
//  SkillDesViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "SkillDesViewController.h"
#import "UIImageView+WebCache.h"
@interface SkillDesViewController ()

@end

@implementation SkillDesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _skillImage = [[UIImageView alloc]initWithFrame:(CGRectMake(10, 10, KScreenWidth/5, KScreenWidth/5))];
    _nameLable = [[UILabel alloc]initWithFrame:(CGRectMake(10 + KScreenWidth/5 + 15, 10, 70, 30))];
    _nameLable.textColor = [UIColor whiteColor];
    _levelLale = [[UILabel alloc]initWithFrame:(CGRectMake(10 + KScreenWidth/5 + 15, 10 + 30 + 10, 80, 20))];
    _cooldownLabel = [[UILabel alloc]initWithFrame:(CGRectMake(10 + KScreenWidth/5 + 15, 10 + 30 + 10 + 20 + 10, 80, 20))];
    _levelLale.textColor = [UIColor whiteColor];
    _cooldownLabel.textColor = [UIColor whiteColor];
    _levelLale.font = [UIFont systemFontOfSize:13];
    _cooldownLabel.font = [UIFont systemFontOfSize:13];
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    _levelnumber = [[UILabel alloc]initWithFrame:(CGRectMake(10 + KScreenWidth/5 + 15 + 80 + 5, _levelLale.frame.origin.y, 20, 20))];
    _levelnumber.textColor = [UIColor whiteColor];
    _cooldownnumber = [[UILabel alloc]initWithFrame:(CGRectMake(10 + KScreenWidth/5 + 15 + 80 + 5, _cooldownLabel.frame.origin.y, 60, 20))];
    _cooldownnumber.textColor = [UIColor whiteColor];
    _levelnumber.font = [UIFont systemFontOfSize:13];
    _cooldownnumber.font = [UIFont systemFontOfSize:13];
    
    
    _desName = [[UILabel alloc]initWithFrame:(CGRectMake(10, _skillImage.bounds.size.height + 10 + 70, 70, 20))];
    _desName.textColor = [UIColor whiteColor];
    _desName.font = [UIFont systemFontOfSize:13];
    
    
    _desLable = [[UILabel alloc]initWithFrame:(CGRectMake(10, _desName.frame.origin.y + 20 + 5, KScreenWidth - 20, 150))];
    _desLable.text = _skillModel.des;
    _desLable.textColor = [UIColor whiteColor];
    _desLable.numberOfLines = 0;
    CGRect rect1 = [_desLable.text boundingRectWithSize:CGSizeMake(KScreenWidth - 20, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    CGRect rec = _desLable.bounds;
    rec.size.height = rect1.size.height;
    
    _desLable.bounds = rec;
    
    _tipsName = [[UILabel alloc]initWithFrame:(CGRectMake(10, _desLable.frame.origin.y + _desLable.bounds.size.height + 30, 70, 20))];
    _tipsName.textColor = [UIColor whiteColor];
    _tipsName.font = [UIFont systemFontOfSize:13];
    
    _tipsLable = [[UILabel alloc]initWithFrame:(CGRectMake(10, _tipsName.frame.origin.y + 20 + 5, KScreenWidth - 20, 150))];
    _tipsLable.textColor = [UIColor whiteColor];
    _tipsLable.numberOfLines = 0;
    _tipsLable.text = _skillModel.tips;
    
    CGRect rect2 = [_tipsLable.text boundingRectWithSize:CGSizeMake(KScreenWidth - 20, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    CGRect rec1 = _desLable.bounds;
    rec1.size.height = rect2.size.height;
    
    _tipsLable.bounds = rec1;
    
    _levelLale.text = @"需要等级";
    _cooldownLabel.text = @"冷却时间";
    _desName.text = @"描述";
    _tipsName.text = @"提示";
    
    _nameLable.text = _skillModel.name;
    
    _levelnumber.text = _skillModel.level1;
    
    _cooldownnumber.text = [NSString stringWithFormat:@"%@s", _skillModel.cooldown];
    
    
    [_skillImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",_skillModel.skillId]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    
    
    
    
    
    [self.bottomView addSubview:_skillImage];
    [self.bottomView addSubview:_nameLable];
    [self.bottomView addSubview:_levelnumber];
    [self.bottomView addSubview:_levelLale];
    [self.bottomView addSubview:_cooldownnumber];
    [self.bottomView addSubview:_cooldownLabel];
    [self.bottomView addSubview:_desLable];
    [self.bottomView addSubview:_tipsLable];
    [self.bottomView addSubview:_tipsName];
    [self.bottomView addSubview:_desName];

    
    // Do any additional setup after loading the view.
}



- (void)setSkillModel:(HeroSkillModel *)skillModel{
    _skillModel = skillModel;


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
