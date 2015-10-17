//
//  TipsTableViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "TipsTableViewCell.h"

@implementation TipsTableViewCell

- (void)setHeroInfo:(HeroInformation *)heroInfo{
    _heroInfo = heroInfo;
    
    _useTipsLabel.text = _heroInfo.tips;
    _defendTipsLabel.text = _heroInfo.opponentTips;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _title1 = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 80, 30))];
        _title1.text = @"使用技巧:";
        _title1.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_title1];
        
        _useTipsLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_useTipsLabel];
        
        _title2 = [[UILabel alloc]init];
        _title2.text = @"应对技巧:";
        _title2.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_title2];
        
        _defendTipsLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_defendTipsLabel];
        
        
        
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _useTipsLabel.frame = CGRectMake(0, 40, self.contentView.bounds.size.width, 20);
    _useTipsLabel.numberOfLines = 0;
    _useTipsLabel.textColor = [UIColor whiteColor];
    [_useTipsLabel sizeToFit];
    
    _title2.frame = CGRectMake(0, _useTipsLabel.frame.origin.y + _useTipsLabel.bounds.size.height + 10, 80, 30);
    
    _defendTipsLabel.frame = CGRectMake(0, _title2.frame.origin.y + 40, self.contentView.bounds.size.width, 20);
    _defendTipsLabel.textColor = [UIColor whiteColor];
    _defendTipsLabel.numberOfLines = 0;
    [_defendTipsLabel sizeToFit];
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
