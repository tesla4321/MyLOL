//
//  BestPartnersCellTableViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BestPartnersCellTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation BestPartnersCellTableViewCell


- (void)setHeroInfo:(HeroInformation *)heroInfo{
    _heroInfo = heroInfo;
    [_partnerImage1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfo.like[0][@"partner"]]] placeholderImage:[UIImage imageNamed:@"1"]];
    [_partnerImage2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_heroInfo.like[1][@"partner"]]] placeholderImage:[UIImage imageNamed:@"1"]];
    _partnerL1.text = _heroInfo.like[0][@"des"];
    _partnerL2.text = _heroInfo.like[1][@"des"];
    
    
    NSLog(@"%f",_partnerL2.bounds.size.height);
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *bestPartnerLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, 0, 80, 30))];
        bestPartnerLabel.textColor = [UIColor orangeColor];
        bestPartnerLabel.text = @"最佳拍档";
        [self.contentView addSubview:bestPartnerLabel];
        
        _partnerImage1 = [[UIImageView alloc]init];
        [self.contentView addSubview:_partnerImage1];
        
        _partnerL1 = [[UILabel alloc]init];

        [self.contentView addSubview:_partnerL1];
        
        _partnerImage2 = [[UIImageView alloc]init];
        [self.contentView addSubview:_partnerImage2];
        
        _partnerL2 = [[UILabel alloc]init];
        [self.contentView addSubview:_partnerL2];
        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _partnerImage1.frame = (CGRectMake(0, 40, self.contentView.bounds.size.width /6, self.contentView.bounds.size.width/6));
    
    _partnerL1.frame = (CGRectMake(_partnerImage1.frame.origin.x + _partnerImage1.bounds.size.width + 10, 40, self.contentView.bounds.size.width - _partnerImage1.bounds.size.width - 10, 50));
    _partnerL1.numberOfLines = 0;
    _partnerL1.textColor = [UIColor whiteColor];
    [_partnerL1 sizeToFit];
    
    _partnerImage2.frame = (CGRectMake(0, _partnerL1.frame.origin.y + _partnerL1.bounds.size.height + 10, self.contentView.bounds.size.width /6, self.contentView.bounds.size.width /6));
    
    _partnerL2.frame = (CGRectMake(_partnerImage2.frame.origin.x + _partnerImage2.bounds.size.width + 10, _partnerImage2.frame.origin.y, self.contentView.bounds.size.width - _partnerImage2.bounds.size.width - 10, 50));
    
    
    if (_partnerL2.frame.origin.y <= _partnerImage1.frame.origin.y + _partnerImage1.bounds.size.height + 10) {
        CGRect rec = _partnerL2.frame;
        rec.origin.y = _partnerImage1.frame.origin.y+ _partnerImage1.bounds.size.height + 10;
        _partnerL2.frame = rec;
    }
    _partnerL2.numberOfLines = 0;
    _partnerL2.textColor = [UIColor whiteColor];
    [_partnerL2 sizeToFit];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
