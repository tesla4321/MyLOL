//
//  ChooseHeroViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/19.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"
#import "FreeView.h"
#import "HeroInformation.h"
typedef  void(^sendHeroInfoBlock)(HeroInformation *);
@interface ChooseHeroViewController : BaseViewController
@property(nonatomic,strong)FreeView *allHeroView;
@property(nonatomic,strong)HeroInformation *heroInfo;

@property(nonatomic,strong)sendHeroInfoBlock sendBlock;

@end
