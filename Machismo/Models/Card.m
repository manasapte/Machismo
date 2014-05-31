//
//  Card.m
//  Machismo
//
//  Created by Manas Apte on 5/14/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

- (int) match:(NSArray *)otherCards {
    int score = 0;
    for (int i=0; i<otherCards.count; i++) {
        Card *card = otherCards[i];
        if([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }

    return score;
}
@end
