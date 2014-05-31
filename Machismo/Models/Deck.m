//
//  Deck.m
//  Machismo
//
//  Created by Manas Apte on 5/14/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray*) cards {
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(id)card atTop:(BOOL)atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

-(Card *) drawRandomCard {
    Card *randomCard = nil;
    unsigned index = arc4random() % [self.cards count];
    if (self.cards.count) {
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex: index];
    }
    return randomCard;
}

-(void) addCard:(Card *)card {
    [self addCard:card atTop:NO];
}

@end
