//
//  ViewController.m
//  Choose
//
//  Created by Young Kim on 9/8/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (unsafe_unretained, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameLabel becomeFirstResponder];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [[self.nameLabel resignFirstResponder]; 
    return YES;
}
- (IBAction)USCButton:(UIButton *)sender {
    NSString *name = self.nameLabel.text;
    [self.nameLabel resignFirstResponder];
    if ([name isEqualToString:@""]) {
        self.messageLabel.text = @"Fight On!";
    }else {
        self.messageLabel.text = [[NSString alloc] initWithFormat:@"%@, Fight On!",name];
    }
}
- (IBAction)UCLAButton:(UIButton *)sender {
    NSString *name = self.nameLabel.text;
    [self.nameLabel resignFirstResponder];
    if ([name isEqualToString:@""]) {
        self.messageLabel.text = @"Go Bruins!";
    }else {
        self.messageLabel.text = [[NSString alloc] initWithFormat:@"%@, Go Bruins!",name];
    }
}
- (IBAction)resetButton:(UIButton *)sender {
    self.messageLabel.text = @"";
    self.nameLabel.text = @"";
}
- (IBAction)backgroundDidPressed:(UIButton *)sender {
    [self.nameLabel resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
