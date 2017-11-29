//
//  AddViewController.m
//  Flashcard
//
//  Created by Young Kim on 11/5/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *CompanyTextView;
@property (weak, nonatomic) IBOutlet UITextField *GameTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.saveButton.enabled = NO;
    [self.CompanyTextView becomeFirstResponder];
    self.GameTextField.delegate = self;
}

- (void) enableOrDisableSaveButton {
    if (self.GameTextField.text.length > 0 && self.CompanyTextView.text.length > 0) {
        self.saveButton.enabled = YES;
    } else {
        self.saveButton.enabled = NO;
    }
}

- (BOOL)textFieldShouldReturn:(UITextView *)textView{
    [self.CompanyTextView becomeFirstResponder];
    return YES;
}


- (BOOL) textField:(UITextField *) textField shouldChangeCharactersInRange: (NSRange) range replacementString: (NSString *) string {
    [self enableOrDisableSaveButton];
    return YES;
}

- (BOOL) textView:(UITextView *) textView shouldChangeTextInRange:(NSRange)range replacementText:(nonnull NSString *)text {
    [self enableOrDisableSaveButton];
    return YES;
}


- (IBAction)saveButtonDidPressed:(UIButton *)sender {
    [self.CompanyTextView resignFirstResponder];
    [self.GameTextField resignFirstResponder];
    self.flashcardCompletionHandler(self.CompanyTextView.text, self.GameTextField.text);
}
- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.CompanyTextView resignFirstResponder];
    [self.GameTextField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
