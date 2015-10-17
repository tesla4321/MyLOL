//
//  SuggestTableViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equip.h"
@interface SuggestTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *title;

@property(nonatomic,strong)UILabel *sectionNumber;
@property(nonatomic,strong)UILabel *Player;
@property(nonatomic,strong)UIImageView *image1;
@property(nonatomic,strong)UIImageView *image2;
@property(nonatomic,strong)UIImageView *image3;
@property(nonatomic,strong)UIImageView *image4;
@property(nonatomic,strong)UIImageView *image5;
@property(nonatomic,strong)UIImageView *image6;

@property(nonatomic,strong)NSMutableArray *imageArr;
@property(nonatomic,strong)Equip *equipModel;


@end
