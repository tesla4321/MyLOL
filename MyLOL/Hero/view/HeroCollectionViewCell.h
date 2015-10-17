//
//  HeroCollectionViewCell.h
//  MyLOL
//
//  Created by kayle on 15/10/13.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hero.h"
@interface HeroCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *heroImageView;
@property(nonatomic,strong)UILabel *title;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *location;


@property(nonatomic,strong)Hero *hero;



@end
