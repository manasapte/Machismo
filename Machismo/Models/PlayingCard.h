//
//  PlayingCard.h
//  Machismo
//
//  Created by Manas Apte on 5/14/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;
@end
