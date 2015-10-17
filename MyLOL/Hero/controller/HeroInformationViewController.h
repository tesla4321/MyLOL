//
//  HeroInformationViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"
#import "HeroInformation.h"
#import "DataView.h"
#import "EquipmentView.h"
@interface HeroInformationViewController : BaseViewController

@property(nonatomic,strong)HeroInformation *heroInfomation;

@property(nonatomic,strong)DataView *dataView;

@property(nonatomic,strong)EquipmentView *equipview;

@end
