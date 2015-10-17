//
//  DataView.h
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroInformation.h"
@interface DataView : UIView

@property(nonatomic,strong)UITableView *tabelView;

@property(nonatomic,strong)HeroInformation *heroInformation;

@end
