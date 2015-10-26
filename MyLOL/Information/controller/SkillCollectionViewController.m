//
//  SkillCollectionViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "SkillCollectionViewController.h"
#import "HeroSkillCollectionViewCell.h"
#import "NetHandler.h"
#import "SkillDesViewController.h"
#import "UIImageView+WebCache.h"
@interface SkillCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation SkillCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *fLayout = [[UICollectionViewFlowLayout alloc]init];
    
    fLayout.minimumLineSpacing = 20;
    fLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    fLayout.itemSize = CGSizeMake((KScreenWidth - 50)/4, (KScreenWidth - 50)/4 + 20);
    
    fLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collectionView = [[UICollectionView alloc]initWithFrame:(CGRectMake(0, 0, KScreenWidth, self.bottomView.bounds.size.height)) collectionViewLayout:fLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = KImageColor;
    [_collectionView registerClass:[HeroSkillCollectionViewCell class] forCellWithReuseIdentifier:@"cell8"];
    
    [self.bottomView addSubview:_collectionView];
    [self netparse];
    // Do any additional setup after loading the view.
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SkillDesViewController *skillDesVC = [[SkillDesViewController alloc]init];
    
    skillDesVC.skillModel = _skillArray[indexPath.item];
        
    [self.navigationController pushViewController:skillDesVC animated:1];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _skillArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroSkillCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell8" forIndexPath:indexPath];
    cell.skillModel = _skillArray[indexPath.item];

    return cell;
}

- (void)netparse{
    [NetHandler getDataWithUrl:@"http://lolbox.duowan.com/phone/apiSumAbility.php?v=70&OSType=iOS8.1.2" completion:^(NSData *data) {
        _skillArray = [NSMutableArray array];
        NSArray *rootArr = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dic in rootArr) {
            HeroSkillModel *skillModel = [[HeroSkillModel alloc]init];
            [skillModel setValuesForKeysWithDictionary:dic];
            [_skillArray addObject:skillModel];
        }
        [_collectionView reloadData];
        
    }];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
