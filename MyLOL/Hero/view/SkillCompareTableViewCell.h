//
//  SkillCompareTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/19.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkillModel.h"
@interface SkillCompareTableViewCell : UITableViewCell

@property(nonatomic,strong)UIButton *image1;
@property(nonatomic,strong)UIButton *image2;

@property(nonatomic,strong)UIImageView *flowImage1;
@property(nonatomic,strong)UIImageView *flowImage2;



@property(nonatomic,strong)UILabel *label2;

@property(nonatomic,strong)UILabel *skillName;

@property(nonatomic,strong)SkillModel *skillModel;





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







@end
