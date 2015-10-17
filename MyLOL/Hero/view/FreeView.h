//
//  FreeView.h
//  MyLOL
//
//  Created by kayle on 15/10/13.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroCollectionViewCell.h"
@interface FreeView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)UICollectionView *freeCollection;
@property(nonatomic,strong)HeroCollectionViewCell *heroCell;


@end
