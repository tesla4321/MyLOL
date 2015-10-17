//
//  HeroBackgroundTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"
@interface HeroBackgroundTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)HeroInformation *heroInfo;



@end
