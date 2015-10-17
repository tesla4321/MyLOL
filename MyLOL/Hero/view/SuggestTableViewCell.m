//
//  SuggestTableViewCell.m
//  MyLOL
//
//  Created by kayle on 15/10/16.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "SuggestTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation SuggestTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _title = [[UILabel alloc]initWithFrame:(CGRectMake(10, 10, 300, 30))];
        _title.textColor = [UIColor orangeColor];
//        _title.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_title];
        
        _sectionNumber = [[UILabel alloc]initWithFrame:(CGRectMake(10, 50, 80, 20))];
        _sectionNumber.font = [UIFont systemFontOfSize:13];
        _sectionNumber.textColor = [UIColor whiteColor];
//        _sectionNumber.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_sectionNumber];
        
        _Player = [[UILabel alloc]initWithFrame:(CGRectMake(110, 50, 150, 20))];
        _Player.font = [UIFont systemFontOfSize:13];
        _Player.textColor = [UIColor whiteColor];
//        _Player.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:_Player];
        
        _imageArr = [NSMutableArray array];
        for (int i = 0; i < 6; i ++) {
            UIImageView *imageview = [[UIImageView alloc]initWithFrame:(CGRectMake(10 + (([UIScreen mainScreen].bounds.size.width - 70)/6 + 10) * i, 80, ([UIScreen mainScreen].bounds.size.width - 70)/6, ([UIScreen mainScreen].bounds.size.width - 70)/6))];
            
//            imageview.backgroundColor = [UIColor greenColor];
            [self.contentView addSubview:imageview];
            [_imageArr addObject:imageview];
        }
        
    }
    return self;
}

- (void)setEquipModel:(Equip *)equipModel{
    _equipModel = equipModel;
    
    _title.text = equipModel.title;
    _sectionNumber.text = equipModel.server;
    _Player.text = equipModel.author;
    NSArray *arr = [equipModel.end_cz componentsSeparatedByString:@","];
    
    for (int i = 0; i < 6; i ++) {
        [_imageArr[i] sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%@_64x64.png",arr[i]]] placeholderImage:[UIImage imageNamed:@"1"]];
        
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
