//
//  SkillTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"
#import "SkillModel.h"
@interface SkillTableViewCell : UITableViewCell


@property(nonatomic,strong)NSMutableArray *btnArray;
@property(nonatomic,strong)NSMutableArray *imageViewArr;

@property(nonatomic,strong)HeroInformation *heroInfo;

@property(nonatomic,strong)UILabel *skillNameLabel;
@property(nonatomic,strong)UILabel *skillDescriptionLabel;
@property(nonatomic,strong)UILabel *consumeDesLabel;
@property(nonatomic,strong)UILabel *coolDownLabel;
@property(nonatomic,strong)UILabel *rangeLabel;
@property(nonatomic,strong)UILabel *effectLabel;


@property(nonatomic,strong)UILabel *skillDescriptionLabelI;
@property(nonatomic,strong)UILabel *consumeDesLabelI;
@property(nonatomic,strong)UILabel *coolDownLabelI;
@property(nonatomic,strong)UILabel *rangeLabelI;
@property(nonatomic,strong)UILabel *effectLabelI;

@property(nonatomic,strong)SkillModel *skillModel;














@end
