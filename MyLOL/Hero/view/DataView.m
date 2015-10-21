//
//  DataView.m
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "DataView.h"
#import "SkillTableViewCell.h"
#import "BestPartnersCellTableViewCell.h"
#import "BestEnemiesTableViewCell.h"
#import "TipsTableViewCell.h"
#import "HeroDataCell.h"
#import "HeroBackgroundTableViewCell.h"
@interface DataView()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)SkillModel *skill;
@property(nonatomic,strong)NSArray *arr;

@end


@implementation DataView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _tabelView = [[UITableView alloc]initWithFrame:(CGRectMake(10, 10, frame.size.width - 20, frame.size.height - 10))];
        _tabelView.delegate = self;
        _tabelView.dataSource = self;
        _tabelView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        _tabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_tabelView];
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

#pragma mark-自适应高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        
        
        CGRect rect1 = [self.skill.description1 boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5 / 6 - 10, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        CGRect rect = [self.skill.effect boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5 / 6 -10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        
        CGFloat height = 150 + rect1.size.height + rect.size.height + ([UIScreen mainScreen].bounds.size.width - 60)/5;
        
//        NSLog(@"%f + %f + %f = %f",rect1.size.height,rect.size.height, ([UIScreen mainScreen].bounds.size.width - 60)/5,height);
        return height ;
    }
    if (indexPath.row == 1) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        if (self.heroInformation.like.count == 0) {
            return 80;
        }else{
        
        CGRect rect1 = [self.heroInformation.like[0][@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5/ 6 - 10, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        CGRect rect = [self.heroInformation.like[1][@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5/ 6  - 10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        CGFloat height = rect.size.height + rect1.size.height;
        
//        NSLog(@"%f + %f = %f",rect.size.height,rect1.size.height,height);
        return height + 80;
        }
        
        
    }
    
    if (indexPath.row == 2) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        if (self.heroInformation.hate.count == 0) {
            return 80;
        }else{
        
        CGRect rect1 = [self.heroInformation.hate[0][@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5/ 6 - 10, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        CGRect rect = [self.heroInformation.hate[1][@"des"] boundingRectWithSize:CGSizeMake(self.bounds.size.width * 5/ 6  - 10, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        CGFloat height = rect.size.height + rect1.size.height;
        
        //        NSLog(@"%f + %f = %f",rect.size.height,rect1.size.height,height);
        return height + 80;
        }

    }
    
    if (indexPath.row == 3) {
        NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        
        
        CGRect rect1 = [self.heroInformation.tips boundingRectWithSize:CGSizeMake(self.bounds.size.width, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        CGRect rect = [self.heroInformation.opponentTips boundingRectWithSize:CGSizeMake(self.bounds.size.width, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
        
        CGFloat height = rect.size.height + rect1.size.height;
        
        //        NSLog(@"%f + %f = %f",rect.size.height,rect1.size.height,height);
        return height + 90;
        
        
    }
    if (indexPath.row == 4) {
        return 350;
    }
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    
    CGRect rect1 = [self.heroInformation.description1 boundingRectWithSize:CGSizeMake(self.bounds.size.width, NSIntegerMax) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect1.size.height + 40;
    
}



- (void)setHeroInformation:(HeroInformation *)heroInformation{
    
    _skill = heroInformation.Skill_B;
    _arr = [NSArray arrayWithObjects:heroInformation.Skill_B,heroInformation.Skill_Q,heroInformation.Skill_W,heroInformation.Skill_E,heroInformation.Skill_R, nil];
    _heroInformation = heroInformation;
    [_tabelView reloadData];
    NSLog(@"%@",_heroInformation.displayName);
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *reUseIdentifier = @"cell";
        SkillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
        if (cell == nil) {
            cell = [[SkillTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
        }
        
        cell.heroInfo = _heroInformation;
        cell.skillModel = _skill;
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        
        for (NSInteger i = 0; i < 5; i ++) {
            [cell.btnArray[i] addTarget:self action:@selector(switchSkill:) forControlEvents:(UIControlEventTouchUpInside)];
        }

        return cell;
    }
    if (indexPath.row == 1) {
        static NSString *reUseIdentifier = @"cell1";
        BestPartnersCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
        if (cell == nil) {
            cell = [[BestPartnersCellTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
        }
        
        
        cell.heroInfo = _heroInformation;
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    
    if (indexPath.row == 2) {
        static NSString *reUseIdentifier = @"cell2";
        BestEnemiesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
        if (cell == nil) {
            cell = [[BestEnemiesTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
        }
        
        cell.heroInfo = _heroInformation;
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        return cell;
    }
    if (indexPath.row == 3) {
        static NSString *reUseIdentifier = @"cell3";
        TipsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
        if (cell == nil) {
            cell = [[TipsTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
        }
        cell.heroInfo = _heroInformation;
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        return cell;
    }
    if (indexPath.row == 4) {
        static NSString *reUseIdentifier = @"cell4";
        HeroDataCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
        if (cell == nil) {
            cell = [[HeroDataCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
        }
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        [cell.slider addTarget:self action:@selector(sliderChange:) forControlEvents:(UIControlEventValueChanged)];
        [cell setHeroDetail:_heroInformation degree:1];
//        cell.heroDetail = _heroInformation;
        return cell;
    }
    
    else{
        
        static NSString *reUseIdentifier = @"cell5";
        HeroBackgroundTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUseIdentifier];
        if (cell == nil) {
            cell = [[HeroBackgroundTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:reUseIdentifier];
        }
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"huise.jpg"]];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
        cell.heroInfo = _heroInformation;
        
        return cell;
        
    }
    
}

- (void)sliderChange:(UISlider *)slider{
    HeroDataCell *cell = (HeroDataCell *)[_tabelView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];

    [cell setHeroDetail:_heroInformation degree:(NSInteger)slider.value];

}



- (void)switchSkill:(UIButton *)button{

//    [self.tabelView reloadData];
    SkillTableViewCell *cell = (SkillTableViewCell *)[_tabelView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    for (NSInteger i = 0; i < 5; i ++) {
        if (button.tag - 2000 != i) {
            [self viewWithTag:i + 3000].alpha = 0.5;
        }else{
            [self viewWithTag:i + 3000].alpha = 0;
        }
    }
    _skill = _arr[button.tag - 2000];
    


    cell.skillModel = _arr[button.tag - 2000];
    
    if (cell.skillDescriptionLabelI.text == 0) {
        cell.skillDescriptionLabelI.text = @"无";
    }
    if (cell.effectLabelI.text.length == 0) {
        cell.effectLabelI.text = @"无";
    }
    if (cell.rangeLabelI.text.length == 0) {
        cell.rangeLabelI.text = @"无";
    }
    if (cell.coolDownLabelI.text.length == 0) {
        cell.coolDownLabelI.text = @"无";
    }
    if (cell.consumeDesLabelI.text.length == 0) {
        cell.consumeDesLabelI.text = @"无";
    }

    [_tabelView reloadData];
}




@end
