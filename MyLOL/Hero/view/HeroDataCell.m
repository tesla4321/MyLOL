//
//  HeroDataCell.m
//  LOL盒子
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import "HeroDataCell.h"

@interface HeroDataCell()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *rankDegree; // 等级
@property (nonatomic,strong) UILabel *range; // 攻击距离
@property (nonatomic,strong) UILabel *moveSpeed; // 移动速度
@property (nonatomic,strong) UILabel *attack; // 攻击
@property (nonatomic,strong) UILabel *defence; // 防御
@property (nonatomic,strong) UILabel *mana; // 魔法值
@property (nonatomic,strong) UILabel *health; // 生命值
@property (nonatomic,strong) UILabel *criticalChange; // 暴击
@property (nonatomic,strong) UILabel *manaRegen; // 魔法回复
@property (nonatomic,strong) UILabel *healthRegen; // 生命回复
@property (nonatomic,strong) UILabel *magicResist; // 魔法抗性

@end

@implementation HeroDataCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // titleLabel
        self.titleLabel = [[UILabel alloc] initWithFrame:(CGRectMake(kLeft, kTop, 100, 30))];
        self.titleLabel.textColor = [UIColor orangeColor];
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.titleLabel];
        
        // slider
        self.slider = [[UISlider alloc] initWithFrame:(CGRectMake(2 * kLeft, 50, [UIScreen mainScreen].bounds.size.width - 4 *kLeft, 40))];
        self.slider.continuous = YES;
        self.slider.value = 1;
        self.slider.maximumValue = 18;
        self.slider.minimumValue = 1;
        [self.contentView addSubview:self.slider];
        
        //
        CGFloat rankY = 100;
        CGFloat Width = self.bounds.size.width - 4 * kLeft;
        CGFloat Height = 20;
        self.rankDegree = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, rankY, Width, Height))];
        self.rankDegree.font = [UIFont systemFontOfSize:14];
        self.rankDegree.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.rankDegree];
        
        //
        CGFloat rangeY = rankY + Height ;
        self.range = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, rangeY, Width, Height))];
        self.range.font = [UIFont systemFontOfSize:14];
        self.range.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.range];
        
        // moveSpeedY
        CGFloat moveSpeedY = rangeY + Height ;
        self.moveSpeed = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, moveSpeedY, Width, Height))];
        self.moveSpeed.font = [UIFont systemFontOfSize:14];
        self.moveSpeed.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.moveSpeed];
        
        //
        CGFloat attackY = moveSpeedY + Height ;
        self.attack = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, attackY, Width, Height))];
        self.attack.font = [UIFont systemFontOfSize:14];
        self.attack.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.attack];
        
        //
        CGFloat defenceY = attackY + Height ;
        self.defence = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, defenceY, Width, Height))];
        self.defence.font = [UIFont systemFontOfSize:14];
        self.defence.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.defence];
        
        //
        CGFloat manaY = defenceY + Height ;
        self.mana = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, manaY, Width, Height))];
        self.mana.font = [UIFont systemFontOfSize:14];
        self.mana.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.mana];
        
        //
        CGFloat healthY = manaY + Height ;
        self.health = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, healthY, Width, Height))];
        self.health.font = [UIFont systemFontOfSize:14];
        self.health.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.health];
        
        // critical
        CGFloat criticalY = healthY + Height ;
        self.criticalChange = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, criticalY, Width, Height))];
        self.criticalChange.font = [UIFont systemFontOfSize:14];
        self.criticalChange.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.criticalChange];
        
        //
        CGFloat manaRegenY = criticalY + Height ;
        self.manaRegen = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, manaRegenY, Width, Height))];
        self.manaRegen.font = [UIFont systemFontOfSize:14];
        self.manaRegen.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.manaRegen];
        
        //
        CGFloat healthReY = manaRegenY + Height ;
        self.healthRegen = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, healthReY, Width, Height))];
        self.healthRegen.font = [UIFont systemFontOfSize:14];
        self.healthRegen.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.healthRegen];
        
        //
        CGFloat magicResistY = healthReY + Height  ;
        self.magicResist = [[UILabel alloc] initWithFrame:(CGRectMake(2 *kLeft, magicResistY, Width, Height))];
        self.magicResist.font = [UIFont systemFontOfSize:14];
        self.magicResist.textColor = [UIColor whiteColor];
        [self.contentView addSubview:self.magicResist];
        
    }
    return self;
}


- (void)setHeroDetail:(HeroInformation *)heroDetail degree:(NSInteger)degree{
    _heroDetail = heroDetail;
    
    if (degree == 0) {
        degree = 1;
    }
    self.titleLabel.text = @"英雄数据";
    
    self.rankDegree.text = [NSString stringWithFormat:@"          等级:    %ld",degree];
    NSLog(@"%@",_rankDegree.text);
    
    NSString *range = [NSString stringWithFormat:@"   攻击距离:     %@",heroDetail.range];
    self.range.text = range;
    
    NSString *moveSpeed = [NSString stringWithFormat:@"   移动速度:    %@",heroDetail.moveSpeed];
    self.moveSpeed.text = moveSpeed;
    
    NSString *attack = [NSString stringWithFormat:@"   基础攻击:    %.2f(+%@/每级)",[heroDetail.attackBase floatValue] + degree * [heroDetail.attackLevel floatValue],heroDetail.attackLevel];
    self.attack.text = attack;
    
    NSString *defence = [NSString stringWithFormat:@"   基础防御:    %.2f(+%@/每级)",[heroDetail.armorBase floatValue] + degree * [heroDetail.armorLevel floatValue],heroDetail.armorLevel];
    self.defence.text = defence;
    
    NSString *mana = [NSString stringWithFormat:@"基础魔法值:    %.2f(+%@/每级)",[heroDetail.manaBase floatValue] + degree * [heroDetail.manaLevel floatValue],heroDetail.manaLevel];
    self.mana.text = mana;
    
    NSString *health = [NSString stringWithFormat:@"基础生命值:    %.2f(+%@/每级)",[heroDetail.healthBase floatValue] + degree * [heroDetail.healthLevel floatValue],heroDetail.healthLevel];
    self.health.text = health;
    
    NSString *critical = [NSString stringWithFormat:@"   暴击概率:    %.2f(+%@/每级)",[heroDetail.criticalChanceBase floatValue] + degree * [heroDetail.criticalChanceLevel floatValue],heroDetail.criticalChanceLevel];
    self.criticalChange.text = critical;
    
    NSString *manaRegen = [NSString stringWithFormat:@"   魔法回复:    %.2f(+%@/每级)",[heroDetail.manaRegenBase floatValue] + degree * [heroDetail.manaRegenLevel floatValue],heroDetail.manaRegenLevel];
    self.manaRegen.text = manaRegen;
    
    NSString *healthRegen = [NSString stringWithFormat:@"   生命回复:    %.2f(+%@/每级)",[heroDetail.healthRegenBase floatValue] + degree * [heroDetail.healthRegenLevel floatValue],heroDetail.healthRegenLevel];
    self.healthRegen.text = healthRegen;
    
    NSString *magicResist = [NSString stringWithFormat:@"   魔法抗性:    %.1f(+%@/每级)",[heroDetail.magicResistBase floatValue] + degree * [heroDetail.magicResistLevel floatValue],heroDetail.magicResistLevel];
    self.magicResist.text = magicResist;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
