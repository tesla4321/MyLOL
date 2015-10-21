//
//  LOLWiKiViewController.m
//  MyLOL
//
//  Created by kayle on 15/10/20.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "LOLWiKiViewController.h"
#import "NetHandler.h"
#import "LOLWiKiView.h"
#import "UIImageView+WebCache.h"
@interface LOLWiKiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *arr;
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation LOLWiKiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview = [[UITableView alloc]initWithFrame:(CGRectMake(0, self.topView.bounds.size.height, KScreenWidth, self.bottomView.bounds.size.height))];
    _tableview.rowHeight = 60;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    
    UIView *footView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, 0, 0))];
//    _tableview.tableFooterView = footView;
    [_tableview setTableFooterView:footView];
    [self.view addSubview:_tableview];
    [self netparse];
    // Do any additional setup after loading the view.
}

- (void)netparse{
    [NetHandler getDataWithUrl:@"http://box.dwstatic.com/apiToolMenu.php?category=database&v=70&OSType=iOS8.1.2&versionName=2.1.4" completion:^(NSData *data) {
        _arr = [NSMutableArray array];
        NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        for (NSDictionary *dic in dataArray) {
            LOLWiKiView *lolwiki = [[LOLWiKiView alloc]init];
            [lolwiki setValuesForKeysWithDictionary:dic];
            [_arr addObject:lolwiki];
        }
        [_tableview reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reUseIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:reUseIdentifier];
    }
    LOLWiKiView *lolwiki = _arr[indexPath.row];
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:lolwiki.icon] placeholderImage:[UIImage imageNamed:@"1"]];
    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:lolwiki.icon]] scale:1];
    cell.textLabel.text = lolwiki.name;
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow"]];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
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
