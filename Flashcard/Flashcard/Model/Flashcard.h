//
//  Flashcard.h
//  Flashcard
//
//  Created by Young Kim on 10/20/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject

@property (nonatomic, weak) NSString* question;
@property (nonatomic, weak) NSString* answer;
@property (nonatomic) BOOL isFavorite;

-(instancetype) initWithQuestion: (NSString *) question
                          answer: (NSString *) ans;
-(instancetype) initWithQuestion: (NSString *) question
                          answer: (NSString *) ans
                      isFavorite: (BOOL) isFav;

@end
