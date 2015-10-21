//
//  EquipmentView.m
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "EquipmentView.h"
#import "SuggestTableViewCell.h"
@interface EquipmentView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tabelView;

@end

@implementation EquipmentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]) {
        _tabelView = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
        _tabelView.rowHeight = 140;
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabelView.backgroundColor = KImageColor;
        [self addSubview:_tabelView];
    }
    return self;
}

- (void)setEquipArray:(NSArray *)equipArray{
    _equipArray = equipArray;
    [_tabelView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _equipArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reUseIdentifier = @"cell6";
    SuggestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
    if (cell == nil) {
        cell = [[SuggestTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
    }
    cell.equipModel = _equipArray[indexPath.row];
    cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
    [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    return cell;
}

@end
