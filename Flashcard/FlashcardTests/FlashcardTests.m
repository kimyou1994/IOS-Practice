//
//  FlashcardTests.m
//  FlashcardTests
//
//  Created by Young Kim on 10/20/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FlashcardsModel.h"

@interface FlashcardTests : XCTestCase
@property (weak, nonatomic) FlashcardsModel* model;
@end

@implementation FlashcardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.model = [FlashcardsModel sharedModel];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    XCTAssertEqual(5, [self.model numberOfFlashcards]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) testSharedModel {
    FlashcardsModel* model1 = [FlashcardsModel sharedModel];
    [model1 insertWithQuestion:@"Activision" answer:@"Call of Duty" favorite:NO];
    XCTAssertEqual(7, [self.model numberOfFlashcards]);
}

- (void) testInsert {
    [_model insertWithQuestion:@"Activision" answer:@"Call of Duty" favorite:NO ];
    Flashcard* card = [_model flashcardAtIndex:5];
    XCTAssertEqual(@"Call of Duty", [card answer]);
    [_model removeFlashcardAtIndex:5];
}

- (void) testInsertAtIndex {
    [_model insertWithQuestion:@"Activision" answer:@"Call of Duty" favorite:NO atIndex: 1 ];
    Flashcard* card = [_model flashcardAtIndex:1];
    XCTAssertEqual(@"Call of Duty", [card answer]);
}

- (void) testRemoveAtIndex {
    [_model removeFlashcardAtIndex:1];
    XCTAssertEqual(5, [_model numberOfFlashcards]);
    [_model insertWithQuestion:@"Activision" answer:@"Call of Duty" favorite:NO ];
}
- (void) testRemove {
    [_model removeFlashcard];
    XCTAssertEqual(5, [_model numberOfFlashcards]);
    [_model insertWithQuestion:@"Activision" answer:@"Call of Duty" favorite:NO ];
}

- (void) testToggle {
    Flashcard* current = [_model flashcardAtIndex:0];
    [_model toggleFavorite];
    XCTAssertEqual(1, [current isFavorite]);
}

- (void) testNext {
    unsigned int index = [_model getIndex];
    [_model nextFlashcard];
    XCTAssertEqual(index + 1, [_model getIndex]);
}

- (void) testPrev {
    unsigned int index = [_model getIndex];
    [_model prevFlashcard];
    XCTAssertEqual(index - 1, [_model getIndex]);
}
@end

