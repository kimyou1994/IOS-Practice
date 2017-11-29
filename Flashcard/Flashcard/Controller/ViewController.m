//
//  ViewController.m
//  Flashcard
//
//  Created by Young Kim on 10/20/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "ViewController.h"
#import "FlashcardsModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) FlashcardsModel* model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [FlashcardsModel sharedModel];
    Flashcard* current = [self.model randomFlashcard];
    self.mainLabel.text = current.question;
    
    if ([self.model numberOfFlashcards] == 0) {
        [self EmptyFlashCard];
    }
    UITapGestureRecognizer* singleTapPressed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapDidRecognized:)];
    singleTapPressed.numberOfTapsRequired = 1;
    singleTapPressed.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:singleTapPressed];
    
    UITapGestureRecognizer* doubleTapPressed = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapDidRecognized:)];
    doubleTapPressed.numberOfTapsRequired = 2;
    doubleTapPressed.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTapPressed];
    
    UISwipeGestureRecognizer* leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeDidRecognized:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer* rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeDidRecognized:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
    
    [singleTapPressed requireGestureRecognizerToFail:doubleTapPressed];
}

- (void)singleTapDidRecognized:(UITapGestureRecognizer *)tap {
    if ([self.model numberOfFlashcards] == 0) {
        [self EmptyFlashCard];
    }else {
        Flashcard* current = [self.model randomFlashcard];
        [self FlashcardAnimation:current];
    }
}

- (void)doubleTapDidRecognized:(UITapGestureRecognizer *)tap {
    if ([self.model numberOfFlashcards] == 0) {
        self.mainLabel.textColor=UIColor.redColor;
        self.mainLabel.text = @"Please add more Flashcards";
    }else {
    Flashcard* current = [self.model flashcardAtIndex:[self.model getIndex]];
    [self ShowSolutionAnimation:current];
    }
}

- (void)leftSwipeDidRecognized:(UISwipeGestureRecognizer *)swipe {
    if ([self.model numberOfFlashcards] == 0) {
        [self EmptyFlashCard];
    }else {
        Flashcard* current = [self.model nextFlashcard];
        [self FlashcardAnimation:current];
    }
}

- (void)rightSwipeDidRecognized:(UISwipeGestureRecognizer *)swipe {
    if ([self.model numberOfFlashcards] == 0) {
        [self EmptyFlashCard];
    }else {
        Flashcard* current = [self.model prevFlashcard];
        [self FlashcardAnimation:current];
    }
}

-(void) EmptyFlashCard {
    self.mainLabel.textColor=UIColor.blackColor;
    self.mainLabel.text = @"There are no more Flashcards";
}

-(void) FlashcardAnimation:(Flashcard*) current{
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.mainLabel.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.mainLabel.alpha = 1;
                         self.mainLabel.text = current.question;
                         self.mainLabel.textColor = UIColor.blackColor;
                     }];
    
}

-(void) ShowSolutionAnimation:(Flashcard*) current{
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.mainLabel.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         self.mainLabel.alpha = 1;
                         self.mainLabel.text = current.answer;
                         self.mainLabel.textColor = UIColor.redColor;
                     }];
    
}

@end
