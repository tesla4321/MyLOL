//
//  HeroCompareSkillView.h
//  MyLOL
//
//  Created by kayle on 15/10/19.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkillModel.h"
#import "HeroInformation.h"
#import "SkillCompareTableViewCell.h"
@interface HeroCompareSkillView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;


@property(nonatomic,strong)NSArray *skillArrL;
@property(nonatomic,strong)NSArray *skillArrR;
@property(nonatomic,strong)NSMutableArray *skillArray;


@property(nonatomic,strong)HeroInformation *heroInfoL;
@property(nonatomic,strong)HeroInformation *heroInfoR;




@end
