//
//  FreeView.m
//  MyLOL
//
//  Created by kayle on 15/10/13.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "FreeView.h"

@interface FreeView()
//@property(nonatomic,strong)UICollectionView *freeCollection;
@end

@implementation FreeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.minimumLineSpacing = 20;
        layout.itemSize = CGSizeMake(frame.size.width/2 - 30, frame.size.height/8);
        [layout setScrollDirection:(UICollectionViewScrollDirectionVertical)];
         _freeCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 10, frame.size.width - 20, frame.size.height - 90) collectionViewLayout:layout];
        
        _freeCollection.delegate = self;
        _freeCollection.dataSource = self;
        
        [_freeCollection registerClass:[HeroCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        _freeCollection.showsVerticalScrollIndicator = 0;
        _freeCollection.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
        [self addSubview:_freeCollection];
        
        
        
        
    }
    return self;
}

- (void)setArr:(NSMutableArray *)arr{
    _arr = arr;
    [_freeCollection reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _heroCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    
    
    _heroCell.hero = _arr[indexPath.row];
    return _heroCell;
}

@end
