//
//  PlayingCardTestCase.m
//  Matchismo2
//
//  See http://www.preeminent.org/steve/iOSTutorials/XCTest/
//  Created by Gregory Ulsh on 11/18/14.
//  Copyright (c) 2014 CS193P. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PlayingCard.h"

@interface PlayingCardTestCase : XCTestCase

@end

@implementation PlayingCardTestCase

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


- (void)testTheValidSuits
{
    NSLog(@"%s Valid Suits", __PRETTY_FUNCTION__);
    NSArray *theSuits = [PlayingCard validSuits];
    unsigned long howMany = [theSuits count];
    XCTAssertEqual(howMany, 4, @"Should be only 4");
    XCTAssertTrue([theSuits containsObject:@"♥"], "@Must have a heart");
    XCTAssertTrue([theSuits containsObject:@"♦"], "@Must have a diamond");
    XCTAssertTrue([theSuits containsObject:@"♠"], "@Must have a spade");
    XCTAssertTrue([theSuits containsObject:@"♣"], "@Must have a club");
}


- (void)testSetSuitAnyValidAccepted
{
    NSLog(@"%s Set Valid Suits ", __PRETTY_FUNCTION__);
    PlayingCard *card = [[PlayingCard alloc] init];
    [card setSuit:@"♥"];
    XCTAssertEqualObjects(card.suit, @"♥", "Should be an Heart");
    [card setSuit:@"♦"];
    XCTAssertEqualObjects(card.suit, @"♦", "Should be a Diamond");
    [card setSuit:@"♠"];
    XCTAssertEqualObjects(card.suit, @"♠", "Should be a Spade");
    [card setSuit:@"♣"];
    XCTAssertEqualObjects(card.suit, @"♣", "Should be a Club");
}

- (void)testSetSuitInvalidRejected
{
    NSLog(@"%s Set InValid Suit ", __PRETTY_FUNCTION__);
    PlayingCard *card = [[PlayingCard alloc] init];
    [card setSuit:@"A"];
    XCTAssertEqualObjects(card.suit, @"?", "Should not have been recognized");
    XCTAssertNotEqualObjects(card.suit, @"A", "Should not have matched");
}

@end
