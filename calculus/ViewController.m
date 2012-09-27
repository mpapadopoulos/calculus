//
//  ViewController.m
//  calculus
//
//  Created by Marie-Helene on 9/20/12.
//  Copyright (c) 2012 Marie-Helene. All rights reserved.
//

#import "ViewController.h"
#import "CalculusBrain.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic) BOOL userEnteredFloatNumber;
@property (nonatomic) CalculusBrain *brain;
@end

@implementation ViewController
@synthesize display;
@synthesize userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

-(CalculusBrain *)brain{
    if (!_brain) _brain = [[CalculusBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    NSLog(@"user touched %@", digit);

    if (self.userIsInTheMiddleOfEnteringANumber) {
        
        if(!self.userEnteredFloatNumber || (self.userEnteredFloatNumber && ![digit isEqualToString:@"."])){
            self.display.text = [self.display.text stringByAppendingString:digit];
        }
        NSRange range = [self.display.text rangeOfString:@"."];
        if (range.location != NSNotFound) { //using enumerate value of C type struct
            self.userEnteredFloatNumber = YES;
        } else {
            self.userEnteredFloatNumber = NO;
        }

    } else {
        if ([digit isEqualToString:@"."]){
            self.display.text = @"0.";
        } else {
        self.display.text = digit;
        }
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)operationPressed:(UIButton*)sender {
    if(self.userIsInTheMiddleOfEnteringANumber){
        [self enterPressed];
    }
   self.display.text = [NSString stringWithFormat:@"%g", [self.brain performOperation:sender.currentTitle]];
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.userEnteredFloatNumber = NO;
}

@end
