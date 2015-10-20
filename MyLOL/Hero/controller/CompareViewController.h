//
//  CompareViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/17.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"
#import "ChooseTwoHeroView.h"
#import "HeroInformation.h"
#import "HeroCompareInfoView.h"
@interface CompareViewController : BaseViewController

@property(nonatomic,strong)ChooseTwoHeroView *chooseView;
@property(nonatomic,strong)HeroInformation *heroInfo;
@property(nonatomic,strong)HeroCompareInfoView *propertyView;
@property(nonatomic,strong)HeroInformation *heroInfoD;



@end
