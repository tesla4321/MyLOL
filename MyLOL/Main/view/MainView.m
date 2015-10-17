//
//  MainView.m
//  MyLOL
//
//  Created by kayle on 15/10/12.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "MainView.h"

@implementation MainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.hero = [UIButton buttonWithType:(UIButtonTypeCustom)];
        self.hero.frame = CGRectMake(10, 10, 100, 100);
        self.hero.layer.cornerRadius = 50;
        [self.hero setImage:[UIImage imageNamed:@"1"] forState:(UIControlStateNormal)];
        [self addSubview:self.hero];
        
        _equip = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _equip.frame = CGRectMake(self.bounds.size.width - 110, 10, 100, 100);
        _equip.layer.cornerRadius = 50;
        [_equip setImage:[UIImage imageNamed:@"2"] forState:(UIControlStateNormal)];
        [self addSubview:_equip];
        
        _information = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _information.frame = CGRectMake(self.bounds.size.width/2 - 50, self.bounds.size.height - 200, 100, 100);
        _information.layer.cornerRadius = 50;
        [_information setImage:[UIImage imageNamed:@"3"]forState:(UIControlStateNormal)];
        [self addSubview:_information];
        
        self.heroLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, _hero.bounds.size.height - 20, self.hero.bounds.size.width, 20))];
        self.heroLabel.text = @"英雄";
        self.heroLabel.textColor = [UIColor whiteColor];
        self.heroLabel.textAlignment = NSTextAlignmentCenter;
        self.heroLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        self.heroLabel.alpha = 0.8;
        [self.hero addSubview:self.heroLabel];

        _equipLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, _hero.bounds.size.height - 20, _equip.bounds.size.width, 20))];
        _equipLabel.text = @"装备";
        _equipLabel.textColor = [UIColor whiteColor];
        _equipLabel.textAlignment = NSTextAlignmentCenter;
        _equipLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        _equipLabel.alpha = 0.8;
        [_equip addSubview: _equipLabel];
        
        _informationLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, _hero.bounds.size.height - 20, _information.bounds.size.width, 20))];
        _informationLabel.text = @"lol百科";
        _informationLabel.textColor = [UIColor whiteColor];
        _informationLabel.textAlignment = NSTextAlignmentCenter;
        _informationLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        _informationLabel.alpha = 0.8;
        [_information addSubview:_informationLabel];
        
        
        
        [UIView animateKeyframesWithDuration:1 delay:0 options:(UIViewKeyframeAnimationOptionAllowUserInteraction) animations:^{
            
            [UIView setAnimationRepeatAutoreverses:1];
            [UIView setAnimationRepeatCount:NSIntegerMax];
            self.hero.transform = CGAffineTransformMakeRotation(M_PI/6);
            self.hero.transform = CGAffineTransformMakeRotation(-M_PI/6);
            
            
//            _hero.transform = CGAffineTransformRotate(self.transform, M_PI/6);
//            _hero.transform = CGAffineTransformRotate(self.transform, -M_PI/6);
            
            _equip.transform = CGAffineTransformMakeRotation(M_PI/6);
            _equip.transform = CGAffineTransformMakeRotation(-M_PI/6);
            _information.transform = CGAffineTransformMakeRotation(M_PI/6);
            _information.transform = CGAffineTransformMakeRotation(-M_PI/6);
        } completion:^(BOOL finished) {
            
        }];
        
    }
    return self;
}

@end
