//
//  HeroSkillModel.m
//  MyLOL
//
//  Created by kayle on 15/10/22.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "HeroSkillModel.h"

@implementation HeroSkillModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        _skillId = value;
    }
    if ([key isEqualToString:@"level"]) {
        _level1 = value;
    }
}

//- (void)setValue:(id)value forKey:(NSString *)key{
//}

@end
