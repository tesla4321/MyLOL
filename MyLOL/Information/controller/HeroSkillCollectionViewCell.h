//
//  HeroSkillCollectionViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroSkillModel.h"
@interface HeroSkillCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UILabel *skillDesLabel;
@property(nonatomic,strong)UIImageView *skillImage;

@property(nonatomic,strong)HeroSkillModel *skillModel;


@end
