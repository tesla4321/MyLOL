//
//  HeroCompareInfoView.h
//  LOL池子
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"

@interface HeroCompareInfoView : UIView

@property (nonatomic,strong) HeroInformation *heroDetail;
@property (nonatomic,strong) HeroInformation *heroDetailD;

@property (nonatomic,strong) UISlider *slider; // 滑动块

@property (nonatomic,strong) UILabel *level; // 等级
@property (nonatomic,strong) UILabel *levelCount; // 等级
//
@property (nonatomic,strong) UILabel *range;
@property (nonatomic,strong) UILabel *moveSpeed;
@property (nonatomic,strong) UILabel *attackBase; // 基础攻击
@property (nonatomic,strong) UILabel *armorBase; //基础防御
@property (nonatomic,strong) UILabel *manaBase; // 魔法
@property (nonatomic,strong) UILabel *HPBase; // 生命
@property (nonatomic,strong) UILabel *critical; // 暴击
@property (nonatomic,strong) UILabel *manaRegenBase; // 魔法回复
@property (nonatomic,strong) UILabel *HPRegenBase; // 生命回复
@property (nonatomic,strong) UILabel *MRBase; // 魔法抗性

//
@property (nonatomic,strong) UILabel *rangeL;
@property (nonatomic,strong) UILabel *moveSpeedL;
@property (nonatomic,strong) UILabel *attackBaseL; // 基础攻击
@property (nonatomic,strong) UILabel *armorBaseL; //基础防御
@property (nonatomic,strong) UILabel *manaBaseL; // 魔法
@property (nonatomic,strong) UILabel *HPBaseL; // 生命
@property (nonatomic,strong) UILabel *criticalL; // 暴击
@property (nonatomic,strong) UILabel *manaRegenBaseL; // 魔法回复
@property (nonatomic,strong) UILabel *HPRegenBaseL; // 生命回复
@property (nonatomic,strong) UILabel *MRBaseL; // 魔法抗性

//
@property (nonatomic,strong) UILabel *rangeLD;
@property (nonatomic,strong) UILabel *moveSpeedLD;
@property (nonatomic,strong) UILabel *attackBaseLD; // 基础攻击
@property (nonatomic,strong) UILabel *armorBaseLD; //基础防御
@property (nonatomic,strong) UILabel *manaBaseLD; // 魔法
@property (nonatomic,strong) UILabel *HPBaseLD; // 生命
@property (nonatomic,strong) UILabel *criticalLD; // 暴击
@property (nonatomic,strong) UILabel *manaRegenBaseLD; // 魔法回复
@property (nonatomic,strong) UILabel *HPRegenBaseLD; // 生命回复
@property (nonatomic,strong) UILabel *MRBaseLD; // 魔法抗性

- (void)setHeroDetail:(HeroInformation *)heroDetail WithDegree:(NSInteger)degree;
- (void)setHeroDetailD:(HeroInformation *)heroDetailD WithDegree:(NSInteger)degree;

@end
