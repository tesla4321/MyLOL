//
//  SkillModel.h
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SkillModel : NSObject

//"name": "神圣祝福",
//"cost": "60/70/80/90/100 法力",
//"cooldown": "15/15/15/15/15",
//"description": "祝福一名友军英雄，提升目标的移动速度并对目标进行治疗。",
//"range": "900.0",
//"effect": "祝


@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *cost;
@property(nonatomic,strong)NSString *cooldown;
@property(nonatomic,strong)NSString *description1;
@property(nonatomic,strong)NSString *effect;
@property(nonatomic,strong)NSString *range;



- (instancetype)initWithDictionary:(NSDictionary *)dic;



@end
