//
//  SkillTableViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "SkillTableViewCell.h"
#import "UIButton+WebCache.h"

@implementation SkillTableViewCell


- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
    _skillNameLabel.frame = (CGRectMake(0, [_btnArray[0] frame].origin.y + [_btnArray[0] bounds].size.height + 10, [_btnArray[0] bounds].size.width + 10 + 50, 30));
    _skillNameLabel.textColor = [UIColor whiteColor];
    
    _skillDescriptionLabel.frame = (CGRectMake(0, [_skillNameLabel frame].origin.y + [_skillNameLabel bounds].size.height + 10, self.contentView.bounds.size.width/6, 30));
    _skillDescriptionLabel.text = @"描述:";
//    _skillDescriptionLabel.font = [UIFont systemFontOfSize:13];
    _skillDescriptionLabel.textColor = [UIColor whiteColor];
    
    
    _skillDescriptionLabelI.frame = (CGRectMake(_skillDescriptionLabel.frame.origin.x + _skillDescriptionLabel.bounds.size.width + 10, _skillDescriptionLabel.frame.origin.y, self.contentView.bounds.size.width - _skillDescriptionLabel.bounds.size.width - 10, 20));
//    _skillDescriptionLabelI.font = [UIFont systemFontOfSize:13];
    _skillDescriptionLabelI.textColor = [UIColor whiteColor];
    _skillDescriptionLabelI.numberOfLines = 0;
    _skillDescriptionLabelI.lineBreakMode = NSControlCharacterActionLineBreak;
    [_skillDescriptionLabelI sizeToFit];
    [self.contentView addSubview: _skillDescriptionLabelI];
    
    
    _consumeDesLabel.frame = CGRectMake(0, _skillDescriptionLabelI.frame.origin.y + _skillDescriptionLabelI.bounds.size.height, _skillDescriptionLabel.bounds.size.width, 30);
    _consumeDesLabel.text = @"消耗:";
//    _consumeDesLabel.font = [UIFont systemFontOfSize:13];
    _consumeDesLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_consumeDesLabel];
    
    _consumeDesLabelI.frame = (CGRectMake(_consumeDesLabel.frame.origin.x + _consumeDesLabel.bounds.size.width + 10, _consumeDesLabel.frame.origin.y, _skillDescriptionLabelI.bounds.size.width, 20));
    _consumeDesLabel.numberOfLines = 0;
//    _consumeDesLabelI.font = [UIFont systemFontOfSize:13];
    _consumeDesLabelI.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_consumeDesLabelI];
    
    
    _coolDownLabel.frame = (CGRectMake(0, _consumeDesLabelI.frame.origin.y + _consumeDesLabelI.bounds.size.height, _consumeDesLabel.bounds.size.width, 30));
    _coolDownLabel.text = @"冷却:";
//    _coolDownLabel.font = [UIFont systemFontOfSize:13];
    _coolDownLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_coolDownLabel];
    
    _coolDownLabelI.frame = (CGRectMake(_coolDownLabel.frame.origin.x + _coolDownLabel.bounds.size.width + 10, _coolDownLabel.frame.origin.y, _consumeDesLabelI.bounds.size.width, 20));
    _coolDownLabelI.numberOfLines = 0;
//    _coolDownLabelI.font = [UIFont systemFontOfSize:13];
    _coolDownLabelI.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_coolDownLabelI];
    
    
    _rangeLabel.frame = (CGRectMake(0, _coolDownLabelI.frame.origin.y + _coolDownLabelI.bounds.size.height, _coolDownLabel.bounds.size.width, 30));
    _rangeLabel.text = @"范围:";
//    _rangeLabel.font = [UIFont systemFontOfSize:13];
    _rangeLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_rangeLabel];
    
    
    _rangeLabelI.frame = (CGRectMake(_rangeLabel.frame.origin.x + _rangeLabel.bounds.size.width + 10, _rangeLabel.frame.origin.y, _coolDownLabelI.bounds.size.width, 20));
    _rangeLabelI.numberOfLines = 0;
//    _rangeLabelI.font = [UIFont systemFontOfSize:13];
    _rangeLabelI.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_rangeLabelI];
    
    
    _effectLabel.frame = (CGRectMake(0, _rangeLabelI.frame.origin.y + _rangeLabelI.bounds.size.height, _rangeLabel.bounds.size.width, 30));
    _effectLabel.text = @"效果:";
//    _effectLabel.font = [UIFont systemFontOfSize:13];
    _effectLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_effectLabel];
    
    _effectLabelI.frame = (CGRectMake(_effectLabel.frame.origin.x + _effectLabel.bounds.size.width + 10, _effectLabel.frame.origin.y, _rangeLabelI.bounds.size.width, 20));
    _effectLabelI.numberOfLines = 0;
//    _effectLabelI.font = [UIFont systemFontOfSize:13];
    _effectLabelI.textColor = [UIColor whiteColor];
    _effectLabelI.numberOfLines = 0;
    [_effectLabelI sizeToFit];
    [self.contentView addSubview:_effectLabelI];
    
    
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 80, 30))];
        titleLabel.text = @"技能说明";
        titleLabel.textColor = [UIColor orangeColor];
        [self.contentView addSubview:titleLabel];
        
        _btnArray = [NSMutableArray array];
        for (NSInteger i = 0; i < 5; i ++) {
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [btn setFrame:(CGRectMake(0 + (([UIScreen mainScreen].bounds.size.width - 60)/5 + 10) * i, titleLabel.frame.origin.y + titleLabel.bounds.size.height, ([UIScreen mainScreen].bounds.size.width - 60)/5, ([UIScreen mainScreen].bounds.size.width - 60)/5))];
            btn.tag = i + 2000;
            [self.contentView addSubview:btn];
            [_btnArray addObject:btn];
        }
        
        _imageViewArr = [NSMutableArray array];
        for (NSInteger i = 0; i < 5; i ++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:[_btnArray[i] frame]];
            imageView.backgroundColor = [UIColor blackColor];
            imageView.alpha = 0.5;
            imageView.tag = 3000 + i;
            if (i == 0) {
                imageView.alpha = 0;
            }
            [self.contentView addSubview:imageView];
            [_imageViewArr addObject:imageView];
        }
        
        
        
        _skillNameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_skillNameLabel];
        
        _skillDescriptionLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_skillDescriptionLabel];
        
        
        _skillDescriptionLabelI = [[UILabel alloc]init];
        [self.contentView addSubview: _skillDescriptionLabelI];
        
        
        _consumeDesLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_consumeDesLabel];
        
        _consumeDesLabelI = [[UILabel alloc]init];
        [self.contentView addSubview:_consumeDesLabelI];
        
        
        _coolDownLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_coolDownLabel];
        
        _coolDownLabelI = [[UILabel alloc]init];
        [self.contentView addSubview:_coolDownLabelI];
        
        
        _rangeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_rangeLabel];
        
        
        _rangeLabelI = [[UILabel alloc]init];
        [self.contentView addSubview:_rangeLabelI];
        
        
        _effectLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_effectLabel];
        
        _effectLabelI = [[UILabel alloc]init];
        [self.contentView addSubview:_effectLabelI];
        
        
        
        
        
        
        
    }
    return self;
    
}

- (void)setSkillModel:(SkillModel *)skillModel{
    _skillModel = skillModel;
    _skillDescriptionLabelI.text = _skillModel.description1;
    _effectLabelI.text = skillModel.effect;
    _rangeLabelI.text = skillModel.range;
    _coolDownLabelI.text = skillModel.cooldown;
    _consumeDesLabelI.text = skillModel.cost;
    _skillNameLabel.text = skillModel.name;
    if (_skillDescriptionLabelI.text.length == 0) {
        _skillDescriptionLabelI.text = @"无";
    }
    if (_effectLabelI.text.length == 0) {
        _effectLabelI.text = @"无";
    }
    if (_rangeLabelI.text.length == 0) {
        _rangeLabelI.text = @"无";
    }
    if (_coolDownLabelI.text.length == 0) {
        _coolDownLabelI.text = @"无";
    }
    if (_consumeDesLabelI.text.length == 0) {
        _consumeDesLabelI.text = @"无";
    }
}

- (void)setHeroInfo:(HeroInformation *)heroInfo{
    _heroInfo = heroInfo;

    
    for (NSInteger i = 0; i < 5; i ++) {
            [_btnArray[i] sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3", _heroInfo.hero.enName,kArray[i]]] forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"1"]];
        
    }

    
    _skillDescriptionLabelI.text = _heroInfo.Skill_B.description1;
    _effectLabelI.text = _heroInfo.Skill_B.effect;
    _rangeLabelI.text = _heroInfo.Skill_B.range;
    _coolDownLabelI.text = _heroInfo.Skill_B.cooldown;
    _consumeDesLabelI.text = _heroInfo.Skill_B.cost;
    _skillNameLabel.text = _heroInfo.Skill_B.name;
    

    if (_skillDescriptionLabelI.text.length == 0) {
        _skillDescriptionLabelI.text = @"无";
    }
    if (_effectLabelI.text.length == 0) {
        _effectLabelI.text = @"无";
    }
    if (_rangeLabelI.text.length == 0) {
        _rangeLabelI.text = @"无";
    }
    if (_coolDownLabelI.text.length == 0) {
        _coolDownLabelI.text = @"无";
    }
    if (_consumeDesLabelI.text.length == 0) {
        _consumeDesLabelI.text = @"无";
    }
    
    
    
    
}

//- (void)switchSkill:(UIButton *)button{
//
//    for (NSInteger i = 0; i < 5; i ++) {
//        if (button.tag - 2000 != i) {
//            [self viewWithTag:i + 3000].alpha = 0.5;
//        }else{
//            [self viewWithTag:i + 3000].alpha = 0;
//        }
//    }
//
//    switch (button.tag - 2000) {
//        case 0:
//            self.skillModel =
//
//
//            break;
//        case 1:
//            _skillDescriptionLabelI.text = _heroInfo.Skill_Q.description1;
//            _effectLabelI.text = _heroInfo.Skill_Q.effect;
//            _rangeLabelI.text = _heroInfo.Skill_Q.range;
//            _coolDownLabelI.text = _heroInfo.Skill_Q.cooldown;
//            _consumeDesLabelI.text = _heroInfo.Skill_Q.cost;
//            _skillNameLabel.text = _heroInfo.Skill_Q.name;
//
//            break;
//
//        case 2:
//            _skillDescriptionLabelI.text = _heroInfo.Skill_W.description1;
//            _effectLabelI.text = _heroInfo.Skill_W.effect;
//            _rangeLabelI.text = _heroInfo.Skill_W.range;
//            _coolDownLabelI.text = _heroInfo.Skill_W.cooldown;
//            _consumeDesLabelI.text = _heroInfo.Skill_W.cost;
//            _skillNameLabel.text = _heroInfo.Skill_W.name;
//
//            break;
//
//        case 3:
//            _skillDescriptionLabelI.text = _heroInfo.Skill_E.description1;
//            _effectLabelI.text = _heroInfo.Skill_E.effect;
//            _rangeLabelI.text = _heroInfo.Skill_E.range;
//            _coolDownLabelI.text = _heroInfo.Skill_E.cooldown;
//            _consumeDesLabelI.text = _heroInfo.Skill_E.cost;
//            _skillNameLabel.text = _heroInfo.Skill_E.name;
//
//            break;
//
//        case 4:
//            _skillDescriptionLabelI.text = _heroInfo.Skill_R.description1;
//            _effectLabelI.text = _heroInfo.Skill_R.effect;
//            _rangeLabelI.text = _heroInfo.Skill_R.range;
//            _coolDownLabelI.text = _heroInfo.Skill_R.cooldown;
//            _consumeDesLabelI.text = _heroInfo.Skill_R.cost;
//            _skillNameLabel.text = _heroInfo.Skill_R.name;
//
//            break;
//    }
//    
//    if (_skillDescriptionLabelI.text == 0) {
//        _skillDescriptionLabelI.text = @"无";
//    }
//    if (_effectLabelI.text.length == 0) {
//        _effectLabelI.text = @"无";
//    }
//    if (_rangeLabelI.text.length == 0) {
//        _rangeLabelI.text = @"无";
//    }
//    if (_coolDownLabelI.text.length == 0) {
//        _coolDownLabelI.text = @"无";
//    }
//    if (_consumeDesLabelI.text.length == 0) {
//        _consumeDesLabelI.text = @"无";
//    }
//
//    
//    
//}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
