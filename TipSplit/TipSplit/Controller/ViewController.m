//
//  ViewController.m
//  TipSplit
//
//  Created by Young Kim on 9/26/17.
//  Copyright © 2017 Young Jin Kim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *splitCount;
@property (weak, nonatomic) IBOutlet UISwitch *tipButton;
@property (weak, nonatomic) IBOutlet UISlider *tipPercent;
@property (weak, nonatomic) IBOutlet UISegmentedControl *taxPercent;
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *splitNumber;
@property (weak, nonatomic) IBOutlet UILabel *percentTip;
@property (weak, nonatomic) IBOutlet UILabel *taxAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalForTip;
@property (weak, nonatomic) IBOutlet UILabel *tipAmount;
@property (weak, nonatomic) IBOutlet UILabel *totalWithTip;
@property (weak, nonatomic) IBOutlet UILabel *totalPerPerson;
@property double bill;
@property double tax;
@property double tip;
@property double totalForTipValue;
@property int split;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.billTextField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//Update tip depends on whether the switch is on or off, the percentage of tax and slider for tax percent.
- (void) updateTip:(int) switchOn{
    int tips = (int)self.tipPercent.value + 0.5f;
    if(switchOn == 1) { //switch on
        _totalForTipValue = _bill + _tax;
        _tip = tips/100.00 *_totalForTipValue;
    }else {
        _totalForTipValue = _bill;
        _tip = tips/100.00 *_totalForTipValue;
    }
}
//update values whenever something changed
- (void) updateValues {
    double totalWithTip = _bill + _tip + _tax;
    self.taxAmount.text = [[NSString alloc]initWithFormat:@"$%.02f",_tax];
    self.totalForTip.text = [[NSString alloc]initWithFormat:@"$%.02f",_totalForTipValue];
    self.tipAmount.text = [[NSString alloc]initWithFormat:@"$%.02f", _tip];
    self.totalWithTip.text = [[NSString alloc]initWithFormat:@"$%.02f", totalWithTip];
    self.totalPerPerson.adjustsFontSizeToFitWidth = YES;
    self.totalPerPerson.text = [[NSString alloc]initWithFormat:@"$%.02f", totalWithTip/_split];
}
- (IBAction)backgroundPressed:(UIButton *)sender {
    [self.billTextField resignFirstResponder];
    if (self.billTextField.text.length > 0) {
        _bill = self.billTextField.text.doubleValue;
        int index = (int)self.taxPercent.selectedSegmentIndex;
        _tax = _bill * (0.075 + 0.005*index);
        _split = self.splitCount.value;
        _totalForTipValue = _bill + _tax;
        _tip = _totalForTipValue * self.tipPercent.value / 100.0;
        [self updateValues];
    }
}

- (IBAction)taxPercentage:(UISegmentedControl *)sender {
    if (self.billTextField.text.length > 0) {
        _bill = self.billTextField.text.doubleValue;
        if (sender.selectedSegmentIndex == 0) {
            _tax = _bill * 0.075;
        }else if (sender.selectedSegmentIndex == 1) {
            _tax = _bill * 0.08;
        }else if (sender.selectedSegmentIndex == 2) {
            _tax = _bill * 0.085;
        }else if (sender.selectedSegmentIndex == 3) {
            _tax = _bill * 0.09;
        }else if (sender.selectedSegmentIndex == 4) {
            _tax = _bill * 0.095;
        }
        if (self.tipButton.isOn) {
            [self updateTip:1];
        }else {
            [self updateTip:0];
        }
        [self updateValues];
    }
}
- (IBAction)tipPercentage:(UISlider *)sender {
    int tips = (int)sender.value + 0.5f;
    _tip = tips/100.0 * _totalForTipValue;
    self.percentTip.text = [[NSString alloc] initWithFormat:@"%d", tips];
    if (self.billTextField.text.length > 0) {
        [self updateValues];
    }
}
- (IBAction)tipIncludesTax:(UISwitch *)sender {
    if (self.billTextField.text.length > 0) {
        if (sender.isOn) {
            [self updateTip:1];
        } else {
            [self updateTip:0];
        }
        [self updateValues];
    }
}
- (IBAction)splitEven:(UIStepper *)sender {
    int evenSplit = (int)sender.value + 0.5f;
    _split = evenSplit;
    self.splitNumber.text =[[NSString alloc] initWithFormat:@"Even Split  %d", _split];
    if (self.billTextField.text.length > 0) {
        [self updateValues];
    }
}
- (IBAction)clearAll:(UIButton *)sender {
    self.taxPercent.selectedSegmentIndex = 0;
    self.tipPercent.value = 20;
    [self.tipButton setOn:YES animated:YES];
    self.splitCount.value = 1;
    _bill = 0.00;
    _tip = 0.00;
    _tax = 0.00;
    _split = 1;
    _totalForTipValue = 0.00;
    self.splitNumber.text = @"Even Split  1";
    self.percentTip.text = @"20";
    self.billTextField.text = @"";
    self.taxAmount.text = @"";
    self.totalForTip.text = @"";
    self.tipAmount.text = @"";
    self.totalWithTip.text = @"";
    self.totalPerPerson.text = @"";
}

@end
