//
//  SkillCollectionViewController.h
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "BaseViewController.h"

@interface SkillCollectionViewController : BaseViewController

@property(nonatomic,strong)UICollectionView *collectionView;

@property(nonatomic,strong)NSMutableArray *skillArray;

@end
