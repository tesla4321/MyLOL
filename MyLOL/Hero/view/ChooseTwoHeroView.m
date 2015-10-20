//
//  ChooseTwoHeroView.m
//  MyLOL
//
//  Created by kayle on 15/10/17.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "ChooseTwoHeroView.h"

@implementation ChooseTwoHeroView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _btn1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _btn1.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/5, 20, [UIScreen mainScreen].bounds.size.width/5, [UIScreen mainScreen].bounds.size.width/5);
        _btn1.backgroundColor = [UIColor greenColor];
        [self addSubview:_btn1];
        
        _btn2 = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _btn2.frame = CGRectMake(_btn1.bounds.size.width * 3, _btn1.frame.origin.y, _btn1.bounds.size.width, _btn1.bounds.size.height);
        [_btn2 setImage:[UIImage imageNamed:@"add.jpg"] forState:(UIControlStateNormal)];
        [self addSubview:_btn2];
        
        UIImageView *vs = [[UIImageView alloc]initWithFrame:(CGRectMake(_btn1.bounds.size.width * 2 + _btn1.bounds.size.width /3, _btn1.frame.origin.y + _btn1.bounds.size.width/3, _btn1.bounds.size.width/3, _btn1.bounds.size.width/3))];
        vs.image = [UIImage imageNamed:@"versus4"];
        [self addSubview:vs];
    }
    return self;
}

@end
