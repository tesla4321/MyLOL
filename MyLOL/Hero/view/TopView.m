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
        
        UIButton *compareHeroBtton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        compareHeroBtton.frame = CGRectMake(_nameLabel.frame.origin.x + _nameLabel.bounds.size.width + 20, _nameLabel.frame.origin.y, frame.size.width/5, frame.size.height/3);
        [compareHeroBtton setTitle:@"英雄对比" forState:(UIControlStateNormal)];
        compareHeroBtton.backgroundColor = [UIColor orangeColor];
        compareHeroBtton.layer.cornerRadius = 10;
        [self addSubview:compareHeroBtton];
        
        
        UIButton *talentButton = [UIButton buttonWithType:(UIButtonTypeSystem)];
        talentButton.frame = CGRectMake(compareHeroBtton.frame.origin.x, compareHeroBtton.frame.origin.y + compareHeroBtton.bounds.size.height + 10, compareHeroBtton.bounds.size.width, compareHeroBtton.bounds.size.height);
        [talentButton setTitle:@"天赋符文" forState:(UIControlStateNormal)];
        talentButton.backgroundColor = [UIColor orangeColor];
        talentButton.layer.cornerRadius = 10;
        [self addSubview:talentButton];
        
        
        
    }
    return self;
}

@end
