//
//  HeroCompareSkillView.m
//  MyLOL
//
//  Created by kayle on 15/10/19.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroCompareSkillView.h"
#import "UIButton+WebCache.h"
@implementation HeroCompareSkillView

- (void)setHeroInfoL:(HeroInformation *)heroInfoL{
    _heroInfoL = heroInfoL;
    _skillArrL = @[heroInfoL.Skill_B,heroInfoL.Skill_Q,heroInfoL.Skill_W,heroInfoL.Skill_E,heroInfoL.Skill_R];
    _skillArray = [NSMutableArray arrayWithArray:_skillArrL];
    [_tableView reloadData];
}

- (void)setHeroInfoR:(HeroInformation *)heroInfoR{
    _heroInfoR = heroInfoR;
    _skillArrR = @[heroInfoR.Skill_B,heroInfoR.Skill_Q,heroInfoR.Skill_W,heroInfoR.Skill_E,heroInfoR.Skill_R];
    [_tableView reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, 0, KScreenWidth, frame.size.width))];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tableView];
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    
    CGRect rect1 = [[_skillArray[indexPath.row] description1] boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5 / 6 - 10, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];

    CGRect rect = [[(SkillModel *)(_skillArray[indexPath.row]) effect] boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5 / 6 - 10, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect1.size.height + rect.size.height + 150;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

            NSString *reUseIdentifier = @"cell7";
            SkillCompareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
            if (cell == nil) {
                cell = [[SkillCompareTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
            }
    cell.skillModel = _skillArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.image1.tag = 5000 + indexPath.row;
    cell.image2.tag = 6000 + indexPath.row;
    cell.backgroundColor = KImageColor;
    [cell.image1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3",_heroInfoL.hero.enName,kArray[indexPath.row]]] forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"1"]];
    [cell.image2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_%@_64x64.png?v=10&OSType=iOS7.0.3",_heroInfoR.hero.enName,kArray[indexPath.row]]] forState:(UIControlStateNormal) placeholderImage:[UIImage imageNamed:@"1"]];

    [cell.image1 addTarget:self action:@selector(leftButton:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.image2 addTarget:self action:@selector(rightButton:) forControlEvents:(UIControlEventTouchUpInside)];
    return cell;
    
}

- (void)leftButton:(UIButton *)button{
    SkillCompareTableViewCell *cell = (SkillCompareTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:button.tag - 5000 inSection:0]];

    cell.flowImage1.alpha = 0;
    cell.flowImage2.alpha = 0.5;
    
    [_skillArray replaceObjectAtIndex:(button.tag - 5000) withObject: _skillArrL[button.tag - 5000]];
    [_tableView reloadData];
}

- (void)rightButton:(UIButton *)button{
    if (_skillArrR.count) {
    SkillCompareTableViewCell *cell = (SkillCompareTableViewCell *)[_tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:button.tag - 6000 inSection:0]];
    
    cell.flowImage1.alpha = 0.5;
    cell.flowImage2.alpha = 0;
    [_skillArray replaceObjectAtIndex:(button.tag - 6000) withObject:_skillArrR[button.tag - 6000]];
//        _skillArray[button.tag - 6000] = _skillArrR[button.tag - 6000];
    }
    [_tableView reloadData];
}



@end
