//
//  CardMatchingGame.h
//  Card
//
//  Created by Chuwei on 15-1-16.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype) initWithCardCount : (NSUInteger) count
                        UsingDeck : (Deck *) deck;

-(void) chooseCardAtIndex : (NSUInteger) index;
-(Card *) cardAtIndex : (NSUInteger) index;
@property (nonatomic) NSUInteger matchCardNum;
@property (nonatomic,readonly) NSInteger score;
@end
