//
//  ChooseHeroViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/19.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "ChooseHeroViewController.h"

#import "NetHandler.h"
@interface ChooseHeroViewController ()<UICollectionViewDelegate>

@end

@implementation ChooseHeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _allHeroView = [[FreeView alloc]initWithFrame:(CGRectMake(0, self.topView.bounds.size.height, KScreenWidth, KScreenHeight))];
    _allHeroView.freeCollection.delegate = self;
    [self.view addSubview:_allHeroView];
    [self netparse2];
    NSLog(@"%f",KScreenHeight);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)netparse2{
    NSString *url = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroes.php?type=all&v=137&OSType=iOS8.4.1"];
    NSMutableArray *array = [NSMutableArray array];
    [NetHandler  getDataWithUrl:url completion:^(NSData *data) {
        NSDictionary *rootdic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (NSDictionary *dic in rootdic[@"all"]) {
                Hero *hero = [[Hero alloc]init];
                [hero setValuesForKeysWithDictionary:dic];
                [array addObject:hero];
            }
//            NSLog(@"%ld",array.count);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            _allHeroView.arr = array;
//            allarry = array;
        });
        
    }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroCollectionViewCell *cell = (HeroCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *name = cell.hero.enName;
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.1.2&v=70&heroName=%@",name] completion:^(NSData *data) {
        NSDictionary *heroDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        HeroInformation *heroInfo = [[HeroInformation alloc]init:cell.hero];
        [heroInfo setValuesForKeysWithDictionary:heroDic];
        _heroInfo = heroInfo;
        
        _sendBlock(heroInfo);
        [self.navigationController popViewControllerAnimated:1];
    }];
    

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
