//
//  HeroCompareInfoView.m
//  LOL池子
//
//  Created by lanou on 15/10/17.
//  Copyright (c) 2015年 方典. All rights reserved.
//

#import "HeroCompareInfoView.h"
#define KLabelInit [[UILabel alloc] init];
@implementation HeroCompareInfoView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        
        
        self.slider = [[UISlider alloc] init];
        _slider.minimumValue = 1;
        _slider.maximumValue = 18;
        [self addSubview:_slider];
        
        /**
         *
         */
        self.level = KLabelInit
        _level.textAlignment = NSTextAlignmentRight;
        _level.textColor = [UIColor whiteColor];
        _level.font = [UIFont systemFontOfSize:13];
        [self addSubview:_level];
        
        self.levelCount = KLabelInit
        _levelCount.textAlignment = NSTextAlignmentLeft;
        _levelCount.textColor = [UIColor whiteColor];
        _levelCount.font = [UIFont systemFontOfSize:13];
        [self addSubview:_levelCount];
        
        
        
        self.range = KLabelInit
        _range.textAlignment = NSTextAlignmentRight;
        _range.textColor = [UIColor whiteColor];
        _range.font = [UIFont systemFontOfSize:13];
        [self addSubview:_range];
        
        self.moveSpeed = KLabelInit
        _moveSpeed.textAlignment = NSTextAlignmentRight;
        _moveSpeed.textColor = [UIColor whiteColor];
        _moveSpeed.font = [UIFont systemFontOfSize:13];
        [self addSubview:_moveSpeed];
        
        self.attackBase = KLabelInit// 基础攻击
        _attackBase.textAlignment = NSTextAlignmentRight;
        _attackBase.textColor = [UIColor whiteColor];
        _attackBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_attackBase];
        
        self.armorBase = KLabelInit//基础防御
        _armorBase.textAlignment = NSTextAlignmentRight;
        _armorBase.textColor = [UIColor whiteColor];
        _armorBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_armorBase];
        
        self.manaBase = KLabelInit// 魔法
        _manaBase.textAlignment = NSTextAlignmentRight;
        _manaBase.textColor = [UIColor whiteColor];
        _manaBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_manaBase];
        
        self.HPBase = KLabelInit// 生命
        _HPBase.textAlignment = NSTextAlignmentRight;
        _HPBase.textColor = [UIColor whiteColor];
        _HPBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_HPBase];
        
        self.critical = KLabelInit// 暴击
        _critical.textAlignment = NSTextAlignmentRight;
        _critical.textColor = [UIColor whiteColor];
        _critical.font = [UIFont systemFontOfSize:13];
        [self addSubview:_critical];
        
        self.manaRegenBase = KLabelInit// 魔法回复
        _manaRegenBase.textAlignment = NSTextAlignmentRight;
        _manaRegenBase.textColor = [UIColor whiteColor];
        _manaRegenBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_manaRegenBase];
        
        self.HPRegenBase = KLabelInit // 生命回复
        _HPRegenBase.textAlignment = NSTextAlignmentRight;
        _HPRegenBase.textColor = [UIColor whiteColor];
        _HPRegenBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_HPRegenBase];
        
        self.MRBase = KLabelInit// 魔法抗性
        _MRBase.textAlignment = NSTextAlignmentRight;
        _MRBase.textColor = [UIColor whiteColor];
        _MRBase.font = [UIFont systemFontOfSize:13];
        [self addSubview:_MRBase];
        
        //
        self.rangeL = KLabelInit
        _rangeL.textAlignment = NSTextAlignmentLeft;
        _rangeL.textColor = [UIColor whiteColor];
        _rangeL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_rangeL];
        
        self.moveSpeedL = KLabelInit
        _moveSpeedL.textAlignment = NSTextAlignmentLeft;
        _moveSpeedL.textColor = [UIColor whiteColor];
        _moveSpeedL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_moveSpeedL];
        
        self.attackBaseL = KLabelInit// 基础攻击
        _attackBaseL.textAlignment = NSTextAlignmentLeft;
        _attackBaseL.textColor = [UIColor whiteColor];
        _attackBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_attackBaseL];
        
        self.armorBaseL = KLabelInit//基础防御
        _armorBaseL.textAlignment = NSTextAlignmentLeft;
        _armorBaseL.textColor = [UIColor whiteColor];
        _armorBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_armorBaseL];
        
        self.manaBaseL = KLabelInit// 魔法
        _manaBaseL.textAlignment = NSTextAlignmentLeft;
        _manaBaseL.textColor = [UIColor whiteColor];
        _manaBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_manaBaseL];
        
        self.HPBaseL = KLabelInit// 生命
        _HPBaseL.textAlignment = NSTextAlignmentLeft;
        _HPBaseL.textColor = [UIColor whiteColor];
        _HPBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_HPBaseL];
        
        self.criticalL = KLabelInit// 暴击
        _criticalL.textAlignment = NSTextAlignmentLeft;
        _criticalL.textColor = [UIColor whiteColor];
        _criticalL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_criticalL];
        
        self.manaRegenBaseL = KLabelInit// 魔法回复
        _manaRegenBaseL.textAlignment = NSTextAlignmentLeft;
        _manaRegenBaseL.textColor = [UIColor whiteColor];
        _manaRegenBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_manaRegenBaseL];
        
        self.HPRegenBaseL = KLabelInit// 生命回复
        _HPRegenBaseL.textAlignment = NSTextAlignmentLeft;
        _HPRegenBaseL.textColor = [UIColor whiteColor];
        _HPRegenBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_HPRegenBaseL];
        
        self.MRBaseL = KLabelInit// 魔法抗性
        _MRBaseL.textAlignment = NSTextAlignmentLeft;
        _MRBaseL.textColor = [UIColor whiteColor];
        _MRBaseL.font = [UIFont systemFontOfSize:13];
        [self addSubview:_MRBaseL];


        
        /**
         *
         */
       
        self.rangeLD = KLabelInit// 魔法抗性
        _rangeLD.textAlignment = NSTextAlignmentLeft;
        _rangeLD.textColor = [UIColor whiteColor];
        _rangeLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_rangeLD];
        
        self.moveSpeedLD = KLabelInit// 魔法抗性
        _moveSpeedLD.textAlignment = NSTextAlignmentLeft;
        _moveSpeedLD.textColor = [UIColor whiteColor];
        _moveSpeedLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_moveSpeedLD];
        
        
        
        self.attackBaseLD = KLabelInit// 魔法抗性
        _attackBaseLD.textAlignment = NSTextAlignmentLeft;
        _attackBaseLD.textColor = [UIColor whiteColor];
        _attackBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_attackBaseLD];
        
        self.armorBaseLD = KLabelInit// 魔法抗性
        _armorBaseLD.textAlignment = NSTextAlignmentLeft;
        _armorBaseLD.textColor = [UIColor whiteColor];
        _armorBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_armorBaseLD];
 
        
        self.manaBaseLD = KLabelInit// 魔法抗性
        _manaBaseLD.textAlignment = NSTextAlignmentLeft;
        _manaBaseLD.textColor = [UIColor whiteColor];
        _manaBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_manaBaseLD];
//
        self.HPBaseLD = KLabelInit// 魔法抗性
        _HPBaseLD.textAlignment = NSTextAlignmentLeft;
        _HPBaseLD.textColor = [UIColor whiteColor];
        _HPBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_HPBaseLD];

        
        self.criticalLD = KLabelInit// 魔法抗性
        _criticalLD.textAlignment = NSTextAlignmentLeft;
        _criticalLD.textColor = [UIColor whiteColor];
        _criticalLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_criticalLD];
        
        self.manaRegenBaseLD = KLabelInit// 魔法抗性
        _manaRegenBaseLD.textAlignment = NSTextAlignmentLeft;
        _manaRegenBaseLD.textColor = [UIColor whiteColor];
        _manaRegenBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_manaRegenBaseLD];
        
        self.HPRegenBaseLD = KLabelInit// 魔法抗性
        _HPRegenBaseLD.textAlignment = NSTextAlignmentLeft;
        _HPRegenBaseLD.textColor = [UIColor whiteColor];
        _HPRegenBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_HPRegenBaseLD];
        
        self.MRBaseLD = KLabelInit// 魔法抗性
        _MRBaseLD.textAlignment = NSTextAlignmentLeft;
        _MRBaseLD.textColor = [UIColor whiteColor];
        _MRBaseLD.font = [UIFont systemFontOfSize:13];
        [self addSubview:_MRBaseLD];



        
        
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
    }
    return self;
}

- (void)layoutSubviews{

    [super layoutSubviews];
    
    
    CGFloat widthLarge = KScreenWidth * 0.64;
    //
    CGFloat width = KScreenWidth / 6;
    CGFloat widthBig = KScreenWidth / 4.2 + 10;
    
    _slider.frame = CGRectMake(kSpacing, kSpacing * 2, KScreenWidth - 4 * kSpacing, 30);
    _level.frame = CGRectMake(kSpacing, _slider.y + _slider.height + kSpacing, width, 20);
    _levelCount.frame = CGRectMake(widthBig, _slider.y + _slider.height + kSpacing, widthBig, 20);
    
    _range.frame = CGRectMake(kSpacing, _level.y + _level.height + kSpacing, width, 20);
    _rangeL.frame = CGRectMake(widthBig, _level.y + _level.height + kSpacing, widthBig, 20);
    _rangeLD.frame = CGRectMake(widthLarge, _level.y + _level.height + kSpacing, widthBig, 20);
    
    _moveSpeed.frame = CGRectMake(kSpacing, _range.y + _range.height + kSpacing, width, 20);
    _moveSpeedL.frame = CGRectMake(widthBig, _range.y + _range.height + kSpacing, widthBig, 20);
    _moveSpeedLD.frame = CGRectMake(widthLarge, _range.y + _range.height + kSpacing, widthBig, 20);
    
    _attackBase.frame = CGRectMake(kSpacing, _moveSpeed.y + _moveSpeed.height + kSpacing, width, 20);
    _attackBaseL.frame = CGRectMake(widthBig, _moveSpeed.y + _moveSpeed.height + kSpacing, widthBig, 20);
    _attackBaseLD.frame = CGRectMake(widthLarge, _moveSpeed.y + _moveSpeed.height + kSpacing, widthBig, 20);
    
    _armorBase.frame = CGRectMake(kSpacing, _attackBase.y + _attackBase.height + kSpacing, width, 20);
    _armorBaseL.frame = CGRectMake(widthBig,  _attackBase.y + _attackBase.height + kSpacing, widthBig, 20);
    _armorBaseLD.frame = CGRectMake(widthLarge,  _attackBase.y + _attackBase.height + kSpacing, widthBig, 20);
    
    _manaBase.frame = CGRectMake(kSpacing, _armorBase.y + _armorBase.height + kSpacing, width, 20);
    _manaBaseL.frame = CGRectMake(widthBig,  _armorBase.y + _armorBase.height + kSpacing, widthBig, 20);
    _manaBaseLD.frame = CGRectMake(widthLarge,  _armorBase.y + _armorBase.height + kSpacing, widthBig, 20);
    
    _HPBase.frame = CGRectMake(kSpacing, _manaBase.y + _manaBase.height + kSpacing, width, 20);
    _HPBaseL.frame = CGRectMake(widthBig,  _manaBase.y + _manaBase.height + kSpacing, widthBig, 20);
    _HPBaseLD.frame = CGRectMake(widthLarge,  _manaBase.y + _manaBase.height + kSpacing, widthBig, 20);
    
    _critical.frame = CGRectMake(kSpacing, _HPBase.y + _HPBase.height + kSpacing, width, 20);
    _criticalL.frame = CGRectMake(widthBig,  _HPBase.y + _HPBase.height + kSpacing, widthBig, 20);
    _criticalLD.frame = CGRectMake(widthLarge,  _HPBase.y + _HPBase.height + kSpacing, widthBig, 20);
    
    _manaRegenBase.frame = CGRectMake(kSpacing, _critical.y + _critical.height + kSpacing, width, 20);
    _manaRegenBaseL.frame = CGRectMake(widthBig,  _criticalL.y + _criticalL.height + kSpacing, widthBig, 20);
    _manaRegenBaseLD.frame = CGRectMake(widthLarge,  _criticalL.y + _criticalL.height + kSpacing, widthBig, 20);
    
    _HPRegenBase.frame = CGRectMake(kSpacing, _manaRegenBase.y + _manaRegenBase.height + kSpacing, width, 20);
    _HPRegenBaseL.frame = CGRectMake(widthBig, _manaRegenBase.y + _manaRegenBase.height + kSpacing, widthBig, 20);
    _HPRegenBaseLD.frame = CGRectMake(widthLarge, _manaRegenBase.y + _manaRegenBase.height + kSpacing, widthBig, 20);
    
    _MRBase.frame = CGRectMake(kSpacing, _HPRegenBase.y + _HPRegenBase.height + kSpacing, width, 20);
    _MRBaseL.frame = CGRectMake(widthBig, _HPRegenBase.y + _HPRegenBase.height + kSpacing, widthBig, 20);
    _MRBaseLD.frame = CGRectMake(widthLarge, _HPRegenBase.y + _HPRegenBase.height + kSpacing, widthBig, 20);
    _level.text = @"等级:";
    _range.text = @"攻击距离:";
    _moveSpeed.text = @"移动速度:";
    _attackBase.text = @"基础攻击:";
    _armorBase.text = @"基础防御:";
    _manaBase.text = @"基础魔法值:";
    _HPBase.text = @"基础生命值:";
    _critical.text = @"暴击概率:";
    _manaRegenBase.text = @"魔法回复:";
    _HPRegenBase.text = @"生命回复:";
    _MRBase.text = @"魔法抗性:";
    _moveSpeedL.text = _heroDetail.moveSpeed;
    _rangeL.text = _heroDetail.range;
}



- (void)setHeroDetailD:(HeroInformation *)heroDetailD WithDegree:(NSInteger)degree{
    _heroDetailD = heroDetailD;
    _moveSpeedLD.text = _heroDetailD.moveSpeed;
    _rangeLD.text = _heroDetailD.range;
    _levelCount.text = [NSString stringWithFormat:@"%ld", degree];
    
    _attackBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.attackBase floatValue] + [_heroDetailD.attackLevel floatValue] * _levelCount.text.intValue, _heroDetailD.attackLevel];
    
    _armorBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.armorBase floatValue] + [_heroDetailD.armorLevel floatValue] * _levelCount.text.intValue, _heroDetailD.armorLevel];
    
    _manaBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.manaBase floatValue] + [_heroDetailD.manaLevel floatValue] * _levelCount.text.intValue, _heroDetailD.manaLevel];
    
    _HPBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.healthBase floatValue] + [_heroDetailD.healthLevel floatValue] * _levelCount.text.intValue, _heroDetailD.healthLevel];
    
    _criticalLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.criticalChanceBase floatValue] + [_heroDetailD.criticalChanceLevel floatValue] * _levelCount.text.intValue, _heroDetailD.criticalChanceLevel];
    
    _manaRegenBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.manaRegenBase floatValue] + [_heroDetailD.manaRegenLevel floatValue] * _levelCount.text.intValue, _heroDetailD.manaRegenLevel];
    
    _HPRegenBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.healthRegenBase floatValue] + [_heroDetailD.healthRegenLevel floatValue] * _levelCount.text.intValue, _heroDetailD.healthRegenLevel];
    
    _MRBaseLD.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetailD.magicResistBase floatValue] + [_heroDetailD.magicResistLevel floatValue] * _levelCount.text.intValue, _heroDetailD.magicResistLevel];
    
}






- (void)setHeroDetail:(HeroInformation *)heroDetail WithDegree:(NSInteger)degree{
    
    if (degree == 0) {
        degree = 1;
    }
    _heroDetail = heroDetail;
    _moveSpeedL.text = _heroDetail.moveSpeed;
    _rangeL.text = _heroDetail.range;
    
    _levelCount.text = [NSString stringWithFormat:@"%ld", degree];
    
    _attackBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.attackBase floatValue] + [_heroDetail.attackLevel floatValue] * _levelCount.text.intValue, _heroDetail.attackLevel];
    
    _armorBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.armorBase floatValue] + [_heroDetail.armorLevel floatValue] * _levelCount.text.intValue, _heroDetail.armorLevel];
    
    _manaBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.manaBase floatValue] + [_heroDetail.manaLevel floatValue] * _levelCount.text.intValue, _heroDetail.manaLevel];
    
    _HPBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.healthBase floatValue] + [_heroDetail.healthLevel floatValue] * _levelCount.text.intValue, _heroDetail.healthLevel];
    
    _criticalL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.criticalChanceBase floatValue] + [_heroDetail.criticalChanceLevel floatValue] * _levelCount.text.intValue, _heroDetail.criticalChanceLevel];
    
    _manaRegenBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.manaRegenBase floatValue] + [_heroDetail.manaRegenLevel floatValue] * _levelCount.text.intValue, _heroDetail.manaRegenLevel];
    
    _HPRegenBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.healthRegenBase floatValue] + [_heroDetail.healthRegenLevel floatValue] * _levelCount.text.intValue, _heroDetail.healthRegenLevel];
    
    _MRBaseL.text = [NSString stringWithFormat:@"%.2f(+%@)", [_heroDetail.magicResistBase floatValue] + [_heroDetail.magicResistLevel floatValue] * _levelCount.text.intValue, _heroDetail.magicResistLevel];
    
    
}


@end
