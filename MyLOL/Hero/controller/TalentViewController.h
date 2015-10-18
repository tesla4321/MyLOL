//
//  TalentViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/17.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"
#import "FWTFmodel.h"
#import "ZoomScrollView.h"
@interface TalentViewController : BaseViewController


@property(nonatomic,strong)ZoomScrollView *runeImage;
@property(nonatomic,strong)ZoomScrollView *talentImage;

@property(nonatomic,strong)UILabel *descriptionLaebl;
@property(nonatomic,strong)UIButton *downloadBtn;
@property(nonatomic,strong)FWTFmodel *fwModel;

@property(nonatomic,strong)NSString *runeDes;
@property(nonatomic,strong)NSString *talentDes;
@property(nonatomic,strong)NSString *runePic;
@property(nonatomic,strong)NSString *talentPic;


@property(nonatomic,strong)ZoomScrollView *zoomView;





@end
