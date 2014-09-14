//
//  PlayingCard.h
//  MatchCards
//
//  Created by Marco Ramirez on 9/8/14.
//  Copyright (c) 2014 Marco Ramirez. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
