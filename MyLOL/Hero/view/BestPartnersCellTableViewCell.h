//
//  BestPartnersCellTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"
@interface BestPartnersCellTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *partnerImage1;
@property(nonatomic,strong)UIImageView *partnerImage2;
@property(nonatomic,strong)UILabel *partnerL1;
@property(nonatomic,strong)UILabel *partnerL2;

@property(nonatomic,strong)HeroInformation *heroInfo;







@end
