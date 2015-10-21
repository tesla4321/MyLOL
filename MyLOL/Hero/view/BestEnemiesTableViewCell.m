//
//  BestEnemiesTableViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BestEnemiesTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation BestEnemiesTableViewCell


- (void)setHeroInfo:(HeroInformation *)heroInfo{
    _heroInfo = heroInfo;
    if (_heroInfo.hate.count == 0) {
        
    }else{
    [_enemyImage1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfo.hate[0][@"partner"]]] placeholderImage:[UIImage imageNamed:@"1"]];
    [_enemyImage2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfo.hate[1][@"partner"]]] placeholderImage:[UIImage imageNamed:@"1"]];
    _enemyL1.text = _heroInfo.hate[0][@"des"];
    _enemyL2.text = _heroInfo.hate[1][@"des"];
    
    
    NSLog(@"%f",_enemyL2.bounds.size.height);
    }
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *bestEnemyLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 80, 30))];
        bestEnemyLabel.textColor = [UIColor orangeColor];
        bestEnemyLabel.text = @"最佳克制";
        [self.contentView addSubview:bestEnemyLabel];
        
        _enemyImage1 = [[UIImageView alloc]init];
        [self.contentView addSubview:_enemyImage1];
        
        _enemyL1 = [[UILabel alloc]init];
        
        [self.contentView addSubview:_enemyL1];
        
        _enemyImage2 = [[UIImageView alloc]init];
        [self.contentView addSubview:_enemyImage2];
        
        _enemyL2 = [[UILabel alloc]init];
        [self.contentView addSubview:_enemyL2];
        
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    _enemyImage1.frame = (CGRectMake(0, 40, self.contentView.bounds.size.width /6, self.contentView.bounds.size.width/6));
    
    _enemyL1.frame = (CGRectMake(_enemyImage1.frame.origin.x + _enemyImage1.bounds.size.width + 10, 40, self.contentView.bounds.size.width - _enemyImage1.bounds.size.width - 10, 50));
    _enemyL1.numberOfLines = 0;
    _enemyL1.textColor = [UIColor whiteColor];
    [_enemyL1 sizeToFit];
    
    _enemyImage2.frame = (CGRectMake(0, _enemyL1.frame.origin.y + _enemyL1.bounds.size.height + 10, self.contentView.bounds.size.width /6, self.contentView.bounds.size.width /6));
    
    _enemyL2.frame = (CGRectMake(_enemyImage2.frame.origin.x + _enemyImage2.bounds.size.width + 10, _enemyImage2.frame.origin.y, self.contentView.bounds.size.width - _enemyImage2.bounds.size.width - 10, 50));
    
    
    if (_enemyL2.frame.origin.y <= _enemyImage1.frame.origin.y + _enemyImage1.bounds.size.height + 10) {
        CGRect rec = _enemyL2.frame;
        rec.origin.y = _enemyImage1.frame.origin.y+ _enemyImage1.bounds.size.height + 10;
        _enemyL2.frame = rec;
    }
    _enemyL2.numberOfLines = 0;
    _enemyL2.textColor = [UIColor whiteColor];
    [_enemyL2 sizeToFit];

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
