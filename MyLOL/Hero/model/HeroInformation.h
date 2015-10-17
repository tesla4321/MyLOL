//
//  HeroInformation.h
//  MyLOL
//
//  Created by kayle on 15/10/14.
//  Copyright © 2015年 bestkayle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Hero.h"
#import "SkillModel.h"
@interface HeroInformation : NSObject

- (instancetype)init:(Hero *)hero;
@property(nonatomic, retain) Hero *hero;

@property(nonatomic, retain) NSString *nameid;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *displayName;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) NSString *iconPath;
@property(nonatomic, retain) NSString *portraitPath;
@property(nonatomic, retain) NSString *splashPath;
@property(nonatomic, retain) NSString *tags;
@property(nonatomic, retain) NSString *description1;
@property(nonatomic, retain) NSString *quote;
@property(nonatomic, retain) NSString *quoteAuthor;
@property(nonatomic, retain) NSString *range;
@property(nonatomic, retain) NSString *moveSpeed;
@property(nonatomic, retain) NSString *armorBase;
@property(nonatomic, retain) NSString *armorLevel;
@property(nonatomic, retain) NSString *manaBase;
@property(nonatomic, retain) NSString *manaLevel;
@property(nonatomic, retain) NSString *criticalChanceBase;
@property(nonatomic, retain) NSString *criticalChanceLevel;
@property(nonatomic, retain) NSString *manaRegenBase;
@property(nonatomic, retain) NSString *manaRegenLevel;
@property(nonatomic, retain) NSString *healthRegenBase;
@property(nonatomic, retain) NSString *healthRegenLevel;
@property(nonatomic, retain) NSString *magicResistBase;
@property(nonatomic, retain) NSString *magicResistLevel;
@property(nonatomic, retain) NSString *healthBase;
@property(nonatomic, retain) NSString *healthLevel;
@property(nonatomic, retain) NSString *attackBase;
@property(nonatomic, retain) NSString *attackLevel;
@property(nonatomic, retain) NSString *ratingDefense;
@property(nonatomic, retain) NSString *ratingMagic;
@property(nonatomic, retain) NSString *ratingDifficulty;
@property(nonatomic, retain) NSString *ratingAttack;
@property(nonatomic, retain) NSString *tips;
@property(nonatomic, retain) NSString *opponentTips;
@property(nonatomic, retain) SkillModel *Skill_B;
@property(nonatomic, retain) SkillModel *Skill_Q;
@property(nonatomic, retain) SkillModel *Skill_W;
@property(nonatomic, retain) SkillModel *Skill_E;
@property(nonatomic, retain) SkillModel *Skill_R;
@property(nonatomic, retain) NSArray *like;
@property(nonatomic, retain) NSArray *hate;


@end
