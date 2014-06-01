//
//  CardGameViewController.m
//  Machismo
//
//  Created by Manas Apte on 5/12/14.
//  Copyright (c) 2014 fantasyworks. All rights reserved.
//

#import "CardGameViewController.h"
#import "Models/PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
//@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
//@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation CardGameViewController

- (PlayingCardDeck *) deck {
    if(!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
 }

/*
- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flip count: %d", flipCount);
}*/

- (CardMatchingGame *) game {
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:self.deck];
    }
    return _game;
}
- (IBAction)touchCardButton:(UIButton *)sender {
    NSInteger idx = [self.cardButtons indexOfObject:sender];
    [self.game selectCardAtIndex:idx];
    [self updateUI];
    
    /*
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@""
                forState:UIControlStateNormal];
    }
    else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:[[self.deck drawRandomCard] contents]
                forState:UIControlStateNormal];
        
    }*/
    //self.flipCount++;
}

- (void) updateUI {
    for(UIButton *cardButton in self.cardButtons) {
        NSUInteger index = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:index];
        if (card.isChosen) {
            [cardButton setTitle:[card contents] forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        } else {
            [cardButton setTitle:@"" forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        }
        cardButton.enabled = !card.isMatched;
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %li", (long)[self.game score]]];
    }
}

@end
