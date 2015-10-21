//
//  NewsViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/20.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "NewsViewController.h"
#import "NetHandler.h"
#import "HeaderlineModel.h"
#import "UIImageView+WebCache.h"
#import "NewsTabelView.h"
@interface NewsViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)NSMutableArray *headerlineArray;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat height = self.bottomView.bounds.size.height;
    _scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, KScreenWidth, height/3))];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(KScreenWidth * 6, height/3);
    _scrollView.pagingEnabled = 1;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.showsHorizontalScrollIndicator = 0;
    [self.bottomView addSubview:_scrollView];
    
    _image6 = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, KScreenWidth, height/3))];
    _image1 = [[UIImageView alloc]initWithFrame:(CGRectMake(KScreenWidth, 0, KScreenWidth, height/3))];
    _image2 = [[UIImageView alloc]initWithFrame:(CGRectMake(KScreenWidth * 2, 0, KScreenWidth, height/3))];
    _image3 = [[UIImageView alloc]initWithFrame:(CGRectMake(KScreenWidth * 3, 0, KScreenWidth, height/3))];
    _image4 = [[UIImageView alloc]initWithFrame:(CGRectMake(KScreenWidth * 4, 0, KScreenWidth, height/3))];
    _image5 = [[UIImageView alloc]initWithFrame:(CGRectMake(KScreenWidth * 5, 0, KScreenWidth, height/3))];
    
    
    _scrollView.contentOffset = CGPointMake(KScreenWidth, 0);
    
    [self.scrollView addSubview:_image1];
    [self.scrollView addSubview:_image2];
    [self.scrollView addSubview:_image3];
    [self.scrollView addSubview:_image4];
    [self.scrollView addSubview:_image5];
    [self.scrollView addSubview:_image6];
    
    
    [self netparse];
    
    NewsTabelView *newsTableView = [[NewsTabelView alloc]initWithFrame:(CGRectMake(0, height/3 + 10, KScreenWidth, height * 2/3))];
    [self.bottomView addSubview:newsTableView];
    // Do any additional setup after loading the view.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    if (offset.x > KScreenWidth * 5) {
        scrollView.contentOffset = CGPointZero;
    }
    if (offset.x < 0) {
        scrollView.contentOffset = CGPointMake(KScreenWidth * 5, 0);
    }
}

- (void)netparse{
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=1" completion:^(NSData *data) {
        _headerlineArray = [NSMutableArray array];
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *rootArr = rootDic[@"headerline"];
        for (NSDictionary *dic in rootArr) {
            HeaderlineModel *headerModel = [[HeaderlineModel alloc]init];
            [headerModel setValuesForKeysWithDictionary:dic];
            [_headerlineArray addObject:headerModel];
        }
        [_image1 sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[0] photo]] placeholderImage:[UIImage imageNamed:@"1"]];
        [_image2 sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[1] photo]] placeholderImage:[UIImage imageNamed:@"1"]];
        [_image3 sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[2] photo]] placeholderImage:[UIImage imageNamed:@"1"]];
        [_image4 sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[3] photo]] placeholderImage:[UIImage imageNamed:@"1"]];
        [_image5 sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[4] photo]] placeholderImage:[UIImage imageNamed:@"1"]];
        [_image6 sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[4] photo]] placeholderImage:[UIImage imageNamed:@"1"]];
        
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
