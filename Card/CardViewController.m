//
//  ViewController.m
//  Card
//
//  Created by Chuwei on 15-1-14.
//  Copyright (c) 2015年 Chuwei. All rights reserved.
//

#import "CardViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardViewController()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMatchingGame *cardGame;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) NSUInteger gameMode;

@end

@implementation CardViewController

-(CardMatchingGame *) cardGame
{
    if (!_cardGame) _cardGame = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                                  UsingDeck:[self createDeck]];
    if (self.gameMode) _cardGame.matchCardNum = self.gameMode;
    return _cardGame;
}

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)turnCard:(UIButton *)sender
{
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.cardGame chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (IBAction)touchRestartButton {
    self.cardGame = nil;
    for (UIButton *cardButton in self.cardButtons){
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"CardBack"] forState:UIControlStateNormal];
        cardButton.enabled = YES;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score: 0"];
}

- (IBAction)gameModeSwitch:(UISwitch *)sender {
    if (sender.isOn) {
        self.gameMode = 3;
    } else {
        self.gameMode = 2;
    }
}

- (void) updateUI
{
    for ( UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.cardGame cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"score: %d", self.cardGame.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"" ;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
}

- (IBAction)restartButton:(UIButton *)sender {
}
@end 
