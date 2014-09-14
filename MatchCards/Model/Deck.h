//
//  Deck.h
//  MatchCards
//
//  Created by Marco Ramirez on 9/8/14.
//  Copyright (c) 2014 Marco Ramirez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
