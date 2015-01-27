//
//  Card.h
//  Card
//
//  Created by Chuwei on 15-1-15.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;

@property (nonatomic,getter=isChosen) BOOL chosen;
@property (nonatomic,getter=isMatched) BOOL matched;

- (int)match:(NSArray*)otherCards;

@end
