//
//  SkillModel.m
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import "SkillModel.h"

@implementation SkillModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _description1 = value;
    }
    
}



- (instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
