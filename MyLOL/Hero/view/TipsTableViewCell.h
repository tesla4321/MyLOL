//
//  TipsTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"
@interface TipsTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *useTipsLabel;
@property(nonatomic,strong)UILabel *defendTipsLabel;
@property(nonatomic,strong)UILabel *title1;

@property(nonatomic,strong)UILabel *title2;


@property(nonatomic,strong)HeroInformation *heroInfo;


@end
