//
//  PlayingCardDeckTestCase.m
//  Matchismo2
//
//  See http://www.preeminent.org/steve/iOSTutorials/XCTest/
//  Created by Gregory Ulsh on 11/19/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Deck.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface PlayingCardDeckTestCase : XCTestCase

@end

@implementation PlayingCardDeckTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    // NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // NSLog(@"%s", __PRETTY_FUNCTION__);
    
    [super tearDown];
}


- (void)testPlayingCardDeckHasTheCorrectInitialCards
{
    NSLog(@"%s Check initial Deck", __PRETTY_FUNCTION__);
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    NSMutableArray *hearts = [@[] mutableCopy];
    NSMutableArray *diamonds = [@[] mutableCopy];
    NSMutableArray *clubs = [@[] mutableCopy];
    NSMutableArray *spades = [@[] mutableCopy];
    PlayingCard *randomCard;
    do {
        randomCard = (PlayingCard *)[deck drawRandomCard];
        if ([randomCard.suit isEqualToString:@"♥"]) [hearts addObject:randomCard];
        if ([randomCard.suit isEqualToString:@"♦"]) [diamonds addObject:randomCard];
        if ([randomCard.suit isEqualToString:@"♠"]) [spades addObject:randomCard];
        if ([randomCard.suit isEqualToString:@"♣"]) [clubs addObject:randomCard];
    } while (randomCard);
    NSUInteger expectedCount = 13;
    XCTAssertEqual([hearts count], expectedCount, @"Should be 13 cards");
    XCTAssertEqual([diamonds count], expectedCount, @"Should be 13 cards");
    XCTAssertEqual([spades count], expectedCount, @"Should be 13 cards");
    XCTAssertEqual([clubs count], expectedCount, @"Should be 13 cards");
}

- (void)testPlayingCardDeckAnswersPlayingCards
{
    NSLog(@"%s Check Playing Card Deck", __PRETTY_FUNCTION__);
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    id card = [deck drawRandomCard];
    XCTAssertTrue([card isKindOfClass:[PlayingCard class]], @"We should be drawing instances of PlayingCard from this deck.");
}


@end
