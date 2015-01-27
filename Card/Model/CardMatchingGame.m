//
//  CardMatchingGame.m
//  Card
//
//  Created by Chuwei on 15-1-16.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,readwrite) NSInteger score;
@property (strong,nonatomic) NSMutableArray *cards;  //of card

@end

@implementation CardMatchingGame

- (NSUInteger) matchCardNum
{
    if (!_matchCardNum) _matchCardNum = 2;
    return _matchCardNum;
}

- (NSMutableArray *) cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
        return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count
                         UsingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for(int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger) index
{
    return (index < [self.cards count])?self.cards[index]:nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHONSE = 1;

- (void) chooseCardAtIndex : (NSUInteger) index
{
    Card *card = [self cardAtIndex : index];
    if (!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        } else {
        //match against other chosen cards;
            NSMutableArray *cardArray = [[NSMutableArray alloc] init];
            NSUInteger i=0;
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [cardArray addObject: otherCard];
                    i++;
                }
                if (i!=0 && i==self.matchCardNum-1) {
                    int matchScore = [card match:cardArray];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        for (Card* matchCard in cardArray) {
                            for (Card *mmcard in self.cards) {
                                if (mmcard == matchCard) {
                                    mmcard.matched = YES;
                                }
                            }
                        }
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        for (Card* matchCard in cardArray) {
                            for (Card *mmcard in self.cards) {
                                if (mmcard == matchCard) {
                                    mmcard.matched = YES;
                                }
                            }
                        }
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHONSE;
            card.chosen = YES;
        }
    }
}


@end
