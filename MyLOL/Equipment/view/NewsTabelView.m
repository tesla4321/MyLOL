//
//  NewsTabelView.m
//  MyLOL
//
//  Created by kayle on 15/10/20.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "NewsTabelView.h"
#import "NetHandler.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"
@interface NewsTabelView()

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *headerlineArray;
@end

@implementation NewsTabelView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        [self addSubview:_tableView];
        [self netparse];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reUseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:reUseIdentifier];
    }
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[_headerlineArray[indexPath.row] photo]]placeholderImage:[UIImage imageNamed:@"1"]];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[_headerlineArray[indexPath.row] photo]]] scale:0.5];
    cell.textLabel.text = [_headerlineArray[indexPath.row] title];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.detailTextLabel.text = [_headerlineArray[indexPath.row] content];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = KImageColor;
    
    return cell;
}

- (void)netparse{
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiNewsList.php?action=l&newsTag=headlineNews&p=1" completion:^(NSData *data) {
        _headerlineArray = [NSMutableArray array];
        NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *rootArr = rootDic[@"data"];
        for (NSDictionary *dic in rootArr) {
            NewsModel *newsModel = [[NewsModel alloc]init];
            [newsModel setValuesForKeysWithDictionary:dic];
            [_headerlineArray addObject:newsModel];
        }
        [_tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _headerlineArray.count;
}

@end
