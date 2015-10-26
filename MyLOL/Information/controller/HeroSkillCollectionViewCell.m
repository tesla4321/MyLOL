//
//  HeroSkillCollectionViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroSkillCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface HeroSkillCollectionViewCell()

@end


@implementation HeroSkillCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _skillImage = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.width))];
        
        _skillDesLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, frame.size.width, frame.size.width, 20))];
        
        _skillDesLabel.textColor = [UIColor whiteColor];
        _skillDesLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_skillImage];
        [self.contentView addSubview:_skillDesLabel];
    }
    return self;
}


- (void)setSkillModel:(HeroSkillModel *)skillModel{
    _skillModel = skillModel;
    
    [_skillImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%@.png",_skillModel.skillId]] placeholderImage:[UIImage imageNamed:@"1"]];
    
    _skillDesLabel.text = _skillModel.name;
}

@end

