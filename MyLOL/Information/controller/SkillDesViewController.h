//
//  SkillDesViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"
#import "HeroSkillModel.h"
@interface SkillDesViewController : BaseViewController

@property(nonatomic,strong)UIImageView *skillImage;
@property(nonatomic,strong)UILabel *nameLable;
@property(nonatomic,strong)UILabel *levelLale;
@property(nonatomic,strong)UILabel *cooldownLabel;
@property(nonatomic,strong)UILabel *desLable;
@property(nonatomic,strong)UILabel *tipsLable;
@property(nonatomic,strong)UILabel *levelnumber;
@property(nonatomic,strong)UILabel *cooldownnumber;
@property(nonatomic,strong)UILabel *desName;
@property(nonatomic,strong)UILabel *tipsName;

@property(nonatomic,strong)HeroSkillModel *skillModel;



@end
