//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by Manas Apte on 5/14/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init {
    self = [super init];
    if (self) {
        for(int i=0; i<[[PlayingCard validSuits] count]; i++) {
            for(int j=1; j<=[PlayingCard maxRank]; j++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = [PlayingCard validSuits][i];
                card.rank = j;
                [self addCard:card];
            }
        }
    }
    return self;
}

@end
