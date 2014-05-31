//
//  PlayingCard.m
//  Machismo
//
//  Created by Manas Apte on 5/14/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *) contents {
    NSArray *ranks = @[@"?", @"A", @"2", @"3", @"4",
                       @"5", @"6", @"7", @"8", @"9",
                       @"10", @"J", @"Q", @"K"];
    return [ranks[self.rank] stringByAppendingString: self.suit];
}

@synthesize suit = _suit;

+ (NSUInteger) maxRank {
    return [[self rankStrings] count]-1;
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4",
             @"5", @"6", @"7", @"8", @"9",
             @"10", @"J", @"Q", @"K"];
}

+ (NSArray *) validSuits {
    return @[@"♣︎", @"♠︎", @"♥︎", @"♦︎"];
}

- (int)match:(NSArray *) otherCards {
    int score = 0;
    if([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherCard = (PlayingCard *) card;
            if(self.suit == otherCard.suit) {
                score = 1;
            }
            if(self.rank == otherCard.rank) {
                score = 4;
            }
        }
    }
    return score;
}

- (void)setSuit:(NSString *)suit {
    if( [[PlayingCard validSuits] containsObject:suit] ) {
        _suit = suit;
    }
}

- (NSString *) suit {
    return _suit ? _suit : @"?";
}

- (void) setRank:(NSUInteger)rank {
    if(rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end