//
//  FlashcardsModel.m
//  Flashcard
//
//  Created by Young Kim on 10/20/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "FlashcardsModel.h"

@implementation FlashcardsModel

-(instancetype) init {
    if(self){
        Flashcard* card1 = [[Flashcard alloc] initWithQuestion:@"Riot" answer:@"League of Legend"];
        Flashcard* card2 = [[Flashcard alloc] initWithQuestion:@"Nexon" answer: @"Maple Story"];
        Flashcard* card3 = [[Flashcard alloc] initWithQuestion:@"Blizzard" answer:@"Overwatch"];
        Flashcard* card4 = [[Flashcard alloc] initWithQuestion:@"Netmarble" answer: @"Seven Knights"];
        Flashcard* card5 = [[Flashcard alloc] initWithQuestion:@"Com2us" answer:@"The World of Magic"];
        
        _flashcards = [[NSMutableArray alloc] init];
        
        [_flashcards addObject:card1];
        [_flashcards addObject:card2];
        [_flashcards addObject:card3];
        [_flashcards addObject:card4];
        [_flashcards addObject:card5];
        
    }
    return self;
}

+(instancetype) sharedModel {
    static FlashcardsModel* _sharedModel = nil;
    if(_sharedModel == nil){
        _sharedModel = [[self alloc] init];
    }
    return _sharedModel;
}

-(NSUInteger) numberOfFlashcards {
    NSUInteger total = [_flashcards count];
    return total;
}

-(Flashcard *) randomFlashcard {
    int size = (int)[_flashcards count];
    int rand = arc4random() % size;
    _currentIndex = rand;
    return [_flashcards objectAtIndex: rand];
}

- (Flashcard *) flashcardAtIndex: (NSUInteger) index{
    int size = (int)[_flashcards count];
    if(index < size ){
        _currentIndex = (unsigned int)index;
        return [_flashcards objectAtIndex:index];
    }
    else{
        return nil;
    }
}

- (Flashcard *) nextFlashcard{
    int size = (int)[_flashcards count];
    if(_currentIndex + 1 < size){
        _currentIndex += 1;
        return [_flashcards objectAtIndex:_currentIndex];
    }
    else{
        _currentIndex =0;
        return [_flashcards objectAtIndex:_currentIndex];
        
    }
}

- (Flashcard *) prevFlashcard{
    if(_currentIndex != 0 ){
        _currentIndex -=1;
        return [_flashcards objectAtIndex:_currentIndex];
    }
    else{
        _currentIndex =(int)[_flashcards count]-1;
        return [_flashcards objectAtIndex:_currentIndex];
    }
    
}
- (void) insertWithQuestion: (NSString *) question answer: (NSString *) ans favorite: (BOOL) fav{
    
    Flashcard* card = [[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav];
    [_flashcards addObject:card];
    
}

- (void) insertWithQuestion: (NSString *) question answer: (NSString *) ans favorite: (BOOL) fav atIndex: (NSUInteger) index{
    if(index <= [_flashcards count])
    {
        Flashcard* card = [[Flashcard alloc] initWithQuestion:question answer:ans isFavorite:fav];
        [_flashcards insertObject:card atIndex:index];
    }
    else{
        printf("index out of bound");
    }
}

- (void) removeFlashcard{
    if([_flashcards count] != 0)
    {
        [_flashcards removeLastObject];
    }
    else{
        printf("index out of bound");
    }
}

- (void) removeFlashcardAtIndex: (NSUInteger) index{
    if(index < [_flashcards count]){
        [_flashcards removeObjectAtIndex:index];
    }
    else{
        printf("index out of bound");
    }
}

- (void) toggleFavorite{
    Flashcard* card = [_flashcards objectAtIndex:_currentIndex];
    if(card.isFavorite != TRUE){
        card.isFavorite = TRUE;
    }
}

- (NSArray *) favoriteFlashcards{
    NSMutableArray* favoriteFlashcards = [[NSMutableArray alloc] init];
    
    int size = (int) [_flashcards count];
    for(int i =0; i < size; i++)
    {
        Flashcard* current = [_flashcards objectAtIndex:i];
        if(current.isFavorite){
            [favoriteFlashcards addObject:current];
        }
    }
    return favoriteFlashcards;
}

-(unsigned int) getIndex {
    return self.currentIndex;
}

@end

