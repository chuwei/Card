//
//  Card.m
//  Card
//
//  Created by Chuwei on 15-1-15.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray*)otherCards
{
    int score = 0;
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString: self.contents]) {
            score=1;
        }
    }
    return score;
}


@end
