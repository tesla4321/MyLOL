//
//  HeroDataCell.h
//  LOL盒子
//
//  Created by lanou on 15/10/15.
//  Copyright (c) 2015年 xxl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"

@interface HeroDataCell : UITableViewCell

@property (nonatomic,strong)HeroInformation *heroDetail;
@property (nonatomic,strong) UISlider *slider; 






- (void)setHeroDetail:(HeroInformation *)heroDetail degree:(NSInteger)degree;
@end
