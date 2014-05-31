//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Manas Apte on 5/16/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

-(NSMutableArray *) cards {
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)cardCount
                        usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for(int i=0; i< cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                self.cards[i] = card;
            } else {
                self.cards = nil;
                break;
            }
        }
    }
    return self;
}

#define FLIP_PENALTY 1
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 2

-(void) selectCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
            self.score -= FLIP_PENALTY;
        } else {
            for (Card *otherCard in [self cards]) {
                if(!otherCard.isMatched && otherCard.isChosen) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            card.chosen = YES;
        }
    }
}

-(Card *) cardAtIndex:(NSUInteger)index {
    return index < [self.cards count] ? self.cards[index] : nil;
}

@end
