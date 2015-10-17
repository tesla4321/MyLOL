//
//  HeroCollectionViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/13.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation HeroCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _heroImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.height, frame.size.height))];
        _title = [[UILabel alloc]initWithFrame:CGRectMake(_heroImageView.bounds.size.width + 5, 0, frame.size.width - _heroImageView.bounds.size.width - 5, frame.size.height/3)];
        
        _name = [[UILabel alloc]initWithFrame:(CGRectMake(_title.frame.origin.x, _title.bounds.size.height, _title.bounds.size.width, _title.bounds.size.height))];
        
        _location = [[UILabel alloc]initWithFrame:(CGRectMake(_title.frame.origin.x, _name.frame.origin.y + _name.bounds.size.height, _title.bounds.size.width, _title.bounds.size.height))];
        
        _title.adjustsFontSizeToFitWidth = 1;
        _name.adjustsFontSizeToFitWidth = 1;
        _location.adjustsFontSizeToFitWidth = 1;
        
        _title.textColor = [UIColor whiteColor];
        _name.textColor = [UIColor whiteColor];
        _location.textColor = [UIColor greenColor];
        
        [self.contentView addSubview:_heroImageView];
        [self.contentView addSubview:_title];
        [self.contentView addSubview:_name];
        [self.contentView addSubview:_location];
        
        
    }
    return self;
}

- (void)setHero:(Hero *)hero{
    _hero = hero;

    
    _title.text = hero.title;
    _name.text = hero.cnName;
    _location.text = hero.location;
    
    [_heroImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",hero.enName]] placeholderImage:[UIImage imageNamed:@"3"]];
    
    
}


@end
