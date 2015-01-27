//
//  PlayingCard.m
//  Card
//
//  Created by Chuwei on 15-1-16.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *)otherCards
{
    int score = 0;
//    if ([otherCards count]==1) {
//        PlayingCard *otherCard = [otherCards firstObject];
//        if (otherCard.rank == self.rank) {
//            score = 4;
//        } else if([otherCard.suit isEqualToString:self.suit]){
//            score = 1;
//        }
//    } else if([otherCards count]==2) {
//        PlayingCard *otherCard1 = [otherCards firstObject];
//        PlayingCard *otherCard2 = otherCards[1];
//        if (otherCard1.rank == self.rank && otherCard2.rank == self.rank) {
//            score = 25;
//        } else if([otherCard1.suit isEqualToString:self.suit] &&
//                  [otherCard2.suit isEqualToString:self.suit]) {
//            score = 1;
//        }
//    }
    
    BOOL rankMismatch = NO;
    BOOL suitMismatch = NO;
    if ([otherCards count]!=0) {
        for (PlayingCard *otherCard in otherCards) {
            if (otherCard.rank != self.rank) {
                rankMismatch = YES;
                break;
            }
        }
        if (!rankMismatch) {
            score = 25;
        }else {
            for (PlayingCard *otherCard in otherCards) {
                if (otherCard.suit != self.suit) {
                    suitMismatch = YES;
                    break;
                }
            }
            if (!suitMismatch) {
                score = 1;
            }
            
        }
    }
    
    return score;
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit;

+ (NSArray *)validSuits
{
    return @[@"♠️",@"♥️",@"♣️",@"♦️"];
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{ return [[self rankStrings] count]-1;}

- (void) setRank:(NSUInteger)rank
{
    if (rank<=[PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
