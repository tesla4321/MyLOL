//
//  TopView.m
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _imageView = [[UIImageView alloc]initWithFrame:(CGRectMake(frame.size.height/10, frame.size.height/10, frame.size.height * 4 / 5, frame.size.height * 4 / 5))];
        [self addSubview:_imageView];
        
        _nameLabel = [[UILabel alloc]initWithFrame:(CGRectMake(_imageView.frame.origin.x + _imageView.bounds.size.width + 10, _imageView.frame.origin.y, frame.size.width * 2/ 5, _imageView.bounds.size.height/3))];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:14.5];
        [self addSubview:_nameLabel];
        
        _priceLabel = [[UILabel alloc]initWithFrame:(CGRectMake(_nameLabel.frame.origin.x, _nameLabel.frame.origin.y + _nameLabel.bounds.size.height, _nameLabel.bounds.size.width, _nameLabel.bounds.size.height))];
        _priceLabel.textColor = [UIColor whiteColor];
        _priceLabel.font = [UIFont systemFontOfSize:14.5];
        
        [self addSubview:_priceLabel];
        
        _characterLabel = [[UILabel alloc]initWithFrame:(CGRectMake(_nameLabel.frame.origin.x, _priceLabel.frame.origin.y + _priceLabel.bounds.size.height, _nameLabel.bounds.size.width, _nameLabel.bounds.size.height))];
        _characterLabel.textColor = [UIColor whiteColor];
        _characterLabel.font = [UIFont systemFontOfSize:14.5];
        _characterLabel.lineBreakMode = NSLineBreakByClipping;
        [self addSubview:_characterLabel];
        
        _compareHeroBtton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _compareHeroBtton.frame = CGRectMake(_nameLabel.frame.origin.x + _nameLabel.bounds.size.width + 20, _nameLabel.frame.origin.y, frame.size.width/5, frame.size.height/3);
        [_compareHeroBtton setTitle:@"英雄对比" forState:(UIControlStateNormal)];
        _compareHeroBtton.backgroundColor = [UIColor orangeColor];
        _compareHeroBtton.layer.cornerRadius = 10;
        [self addSubview:_compareHeroBtton];
        
        
        _talentButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        _talentButton.frame = CGRectMake(_compareHeroBtton.frame.origin.x, _compareHeroBtton.frame.origin.y + _compareHeroBtton.bounds.size.height + 10, _compareHeroBtton.bounds.size.width, _compareHeroBtton.bounds.size.height);
        [_talentButton setTitle:@"天赋符文" forState:(UIControlStateNormal)];
        _talentButton.backgroundColor = [UIColor orangeColor];
        _talentButton.layer.cornerRadius = 10;
        [self addSubview:_talentButton];
        
        
        
    }
    return self;
}

@end
