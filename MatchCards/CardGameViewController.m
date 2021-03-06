//
//  CardGameViewController.m
//  MatchCards
//
//  Created by Marco Ramirez on 9/2/14.
//  Copyright (c) 2014 Marco Ramirez. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectedSegmentMode;

@end

@implementation CardGameViewController
@synthesize selectedSegmentMode;

- (CardMatchingGame *)game {
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
        [self changeModeSelector:self.selectedSegmentMode];
    }
    
    return _game;
}

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback" ];
}

- (IBAction)changeModeSelector:(UISegmentedControl *)sender {
    //self.game.maxMatchingCards = [[sender titleForSegmentAtIndex:sender.selectedSegmentIndex] integerValue];
    if (self.selectedSegmentMode.selectedSegmentIndex == 0) {
        self.game.maxMatchingCards = 2;
    } else if (self.selectedSegmentMode.selectedSegmentIndex == 1){
        self.game.maxMatchingCards = 3;
    }
    /*
    if (self.selectedSegmentMode.selectedSegmentIndex == 0) {
        self.game.maxMatchingCards = 2;
    } else {
        self.game.maxMatchingCards = 3;
    }
    */
}

- (IBAction)resetButton:(UIButton *)sender {
    CardMatchingGame *newGame;
    self.game = newGame;
    [self updateUI];
}

@end
