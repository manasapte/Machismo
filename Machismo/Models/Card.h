//
//  Card.h
//  Machismo
//
//  Created by Manas Apte on 5/14/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isMatched) BOOL matched;
@property (nonatomic, getter=isChosen) BOOL chosen;

- (int)match:(NSArray *) otherCards;

@end
