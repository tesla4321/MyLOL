//
//  HeroInformation.m
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroInformation.h"

@implementation HeroInformation


- (instancetype)init:(Hero *)hero{
    if (self = [super init]) {
        _hero = hero;
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.nameid = value;
    }
    if ([key isEqualToString:@"description"]) {
        self.description1 = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_B",self.hero.enName]]) {
        self.Skill_B = [[SkillModel alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_Q",self.hero.enName]]) {
        self.Skill_Q = [[SkillModel alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_W",self.hero.enName]]) {
        self.Skill_W = [[SkillModel alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_E",self.hero.enName]]) {
        self.Skill_E = [[SkillModel alloc]initWithDictionary:value];
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_R",self.hero.enName]]) {
        self.Skill_R = [[SkillModel alloc]initWithDictionary:value];
    }
    
}





@end
