//
//  AddViewController.h
//  Flashcard
//
//  Created by Young Kim on 11/5/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^AddFlashcardCompletionHandler) (NSString *question, NSString *answer);

@interface AddViewController : UIViewController
@property (copy, nonatomic) AddFlashcardCompletionHandler flashcardCompletionHandler;

@end
