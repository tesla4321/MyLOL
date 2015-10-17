//
//  HeroBackgroundTableViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroBackgroundTableViewCell.h"

@implementation HeroBackgroundTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *title = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 80, 30))];
        title.text = @"英雄背景";
        title.textColor = [UIColor orangeColor];
        [self.contentView addSubview:title];
        
        _label = [[UILabel alloc]init];
        _label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_label];
        
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _label.frame = CGRectMake(0, 40, self.contentView.bounds.size.width, 20);
    _label.numberOfLines = 0;
    [_label sizeToFit];
}

- (void)setHeroInfo:(HeroInformation *)heroInfo{
    _heroInfo = heroInfo;
    _label.text = _heroInfo.description1;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
