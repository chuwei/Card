//
//  PlayingCard.h
//  Card
//
//  Created by Chuwei on 15-1-16.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
