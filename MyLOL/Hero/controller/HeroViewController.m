//
//  HeroViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/13.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroViewController.h"
#import "UIColor+AddColor.h"
#import "FreeView.h"
#import "NetHandler.h"
#import "Hero.h"
#import "HeroInformationViewController.h"
#import "HeroCollectionViewCell.h"
#import "HeroInformation.h"
#import "Equip.h"
static NSMutableArray *allarry ;
@interface HeroViewController ()<UISearchBarDelegate,UICollectionViewDelegate>
@property(nonatomic,strong)FreeView *freeView;
@property(nonatomic,strong)FreeView *allView;
@property(nonatomic,strong)FreeView *myHeroView;
@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)NSMutableArray *lastArr;
@property(nonatomic,strong)UIActivityIndicatorView *activityView;
//@property(nonatomic,strong)FreeView *freeView;



@end

@implementation HeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"周免英雄",@"我的英雄",@"全部英雄"]];
    
    seg.tintColor = [UIColor jinjuse];
    seg.frame = CGRectMake(0, self.topView.bounds.size.height, self.view.bounds.size.width, 30);
    seg.selectedSegmentIndex = 0;
    
    [seg addTarget:self action:@selector(switchView:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:seg];
    
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:(CGRectMake(KScreenWidth/2, KScreenHeight * 2/3, 30, 30))];
    
    _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    
    _activityView.backgroundColor = [UIColor yellowColor];
    
    _myHeroView = [[FreeView alloc]initWithFrame:(CGRectMake(0, 30, seg.bounds.size.width, self.view.bounds.size.height - 30))];
    _myHeroView.tag = 1001;
    _myHeroView.freeCollection.delegate = self;
    _myHeroView.backgroundColor = KImageColor;
    [self netparse3];
    [self.bottomView addSubview:_myHeroView];
    [_myHeroView addSubview:_activityView];
    
    
    _freeView = [[FreeView alloc]initWithFrame:(CGRectMake(0, 30, seg.bounds.size.width, self.view.bounds.size.height - 30))];
    _freeView.tag = 1000;
    _freeView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    _freeView.freeCollection.delegate = self;
    [self netparse];
    
    
    _allView = [[FreeView alloc]initWithFrame:(CGRectMake(0,60, seg.bounds.size.width, self.view.bounds.size.height - 60))];
    
    _allView.tag = 1002;
    _allView.heroCell.title.backgroundColor = [UIColor blueColor];
    _allView.freeCollection.delegate = self;
    [self netparse2];
    
    
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 30, _freeView.bounds.size.width, 40)];
    _searchBar.barStyle = UIBarMetricsDefault;
//    _searchBar.barStyle = UIBarButtonSystemItemSearch;
    _searchBar.placeholder = @"搜索英雄";
    _searchBar.delegate = self;
    _searchBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [_searchBar setShowsCancelButton:1];
    [self.bottomView addSubview:_allView];
    [self.bottomView addSubview:_searchBar];
    [self.bottomView addSubview:_freeView];
    
    [_allView addSubview:_activityView];
    
    [_freeView addSubview:_activityView];
    
    [_activityView startAnimating];

    
    // Do any additional setup after loading the view.
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.text = nil;
    [self netparse2];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    if (searchBar.text.length <= 0) {
        _allView.arr = allarry;
    }
    else{
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.cnName CONTAINS [CD] %@ OR self.location CONTAINS [CD] %@ OR self.title CONTAINS %@",searchBar.text,searchBar.text,searchBar.text];
        _lastArr = [NSMutableArray arrayWithArray:[_allView.arr filteredArrayUsingPredicate:predicate]];
        NSLog(@"%@",_lastArr);
        _allView.arr = _lastArr;
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchBar.text.length <= 0) {
        _allView.arr = allarry;
    }
    else{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.cnName CONTAINS [CD] %@ OR self.location CONTAINS [CD] %@ OR self.title CONTAINS %@",searchBar.text,searchBar.text,searchBar.text];
    _lastArr = [NSMutableArray arrayWithArray:[_allView.arr filteredArrayUsingPredicate:predicate]];
    NSLog(@"%@",_lastArr);
    _allView.arr = _lastArr;
    }

}


- (void)netparse{
    NSString *url = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroes.php?v=70&type=free&OSType=iOS8.4.1"];
    NSMutableArray *array = [NSMutableArray array];
    [NetHandler  getDataWithUrl:url completion:^(NSData *data) {
       NSDictionary *rootdic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (NSDictionary *dic in rootdic[@"free"]) {
                Hero *hero = [[Hero alloc]init];
                [hero setValuesForKeysWithDictionary:dic];
                [array addObject:hero];
            }
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            _freeView.arr = array;
        });
        [_activityView stopAnimating];
        
    }];
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
            NSLog(@"%ld",array.count);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            _allView.arr = array;
            allarry = array;
        });
        [_activityView stopAnimating];
        
    }];
}


- (void)netparse3{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"]) {
    NSString *url = [NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiMyHeroes.php?serverName=%@&OSType=iOS8.1.2&target=%@&v=70",[[[NSUserDefaults standardUserDefaults] valueForKey:@"server"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],[[[NSUserDefaults standardUserDefaults] valueForKey:@"name"] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableArray *array = [NSMutableArray array];
        
        NSLog(@"%@",url);
//        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"server"]);
    [NetHandler  getDataWithUrl:url completion:^(NSData *data) {
        NSDictionary *rootdic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            for (NSDictionary *dic in rootdic[@"myHeroes"]) {
                Hero *hero = [[Hero alloc]init];
                [hero setValuesForKeysWithDictionary:dic];
                [array addObject:hero];
            }
//            NSLog(@"%ld",array.count);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            _myHeroView.arr = array;
        });
        [_activityView stopAnimating];
        
    }];
        
    }
}


#pragma mark-点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HeroInformationViewController *heroInfoVC = [[HeroInformationViewController alloc]init];
    HeroCollectionViewCell *cell = (HeroCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSString *name = cell.hero.enName;
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.1.2&v=70&heroName=%@",name] completion:^(NSData *data) {
       NSDictionary *heroDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        HeroInformation *heroInfo = [[HeroInformation alloc]init:cell.hero];
        [heroInfo setValuesForKeysWithDictionary:heroDic];
        heroInfoVC.heroInfomation = heroInfo;
        heroInfoVC.dataView.heroInformation = heroInfo;
        
    }];
    [NetHandler getDataWithUrl:[NSString stringWithFormat:@"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php?v=70&OSType=iOS8.1.2&limit=7&championName=%@",cell.hero.enName] completion:^(NSData *data) {
        NSMutableArray *equipArray = [NSMutableArray array];
        NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dic in array) {
            Equip *equip = [[Equip alloc]init];
            [equip setValuesForKeysWithDictionary:dic];
            [equipArray addObject:equip];
        }
        heroInfoVC.equipview.equipArray = equipArray;
        
        
    }];
    
    [self.navigationController pushViewController:heroInfoVC animated:1];
}

- (void)switchView:(UISegmentedControl *)segmentedControl{
    [self.bottomView bringSubviewToFront:[self.bottomView viewWithTag:segmentedControl.selectedSegmentIndex + 1000]];
    if (segmentedControl.selectedSegmentIndex == 2) {
        [self.bottomView bringSubviewToFront:_searchBar];
    }


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
