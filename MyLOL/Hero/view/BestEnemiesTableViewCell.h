//
//  BestEnemiesTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"
@interface BestEnemiesTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *enemyImage1;
@property(nonatomic,strong)UIImageView *enemyImage2;
@property(nonatomic,strong)UILabel *enemyL1;
@property(nonatomic,strong)UILabel *enemyL2;

@property(nonatomic,strong)HeroInformation *heroInfo;


@end
