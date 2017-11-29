//
//  FlashcardsModel.h
//  Flashcard
//
//  Created by Young Kim on 10/20/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Flashcard.h"

@interface FlashcardsModel : NSObject

@property (strong, nonatomic) NSMutableArray* flashcards;
@property (readonly, nonatomic) unsigned int currentIndex;
@property (strong, nonatomic) NSString *filepath;

// Creating the model
+ (instancetype) sharedModel;
// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards;
// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger) index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;
// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav;
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav
                    atIndex: (NSUInteger) index;
// Removing a flashcard
- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;
// Favorite/unfavorite the current flashcard
- (void) toggleFavorite;
// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards;
- (unsigned int) getIndex;

@end
