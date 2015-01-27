//
//  Deck.h
//  Card
//
//  Created by Chuwei on 15-1-16.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
