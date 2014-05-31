//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Manas Apte on 5/16/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype) initWithCardCount:(NSUInteger) cardCount
                        usingDeck:(Deck*) deck;
-(void) selectCardAtIndex:(NSUInteger) index;
-(Card *) cardAtIndex:(NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end
