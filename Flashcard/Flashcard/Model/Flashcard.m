//
//  Flashcard.m
//  Flashcard
//
//  Created by Young Kim on 10/20/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "Flashcard.h"

@implementation Flashcard

-(instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans {
    self = [super init];
    if(self) {
        _question = question;
        _answer = ans;
    }
    return self;
}

-(instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans isFavorite:(BOOL)isFav {
    self = [super init];
    if(self) {
        _question = question;
        _answer = ans;
        _isFavorite = isFav;
    }
    return self;
}

@end
