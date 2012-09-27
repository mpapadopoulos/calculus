//
//  CalculusBrain.m
//  calculus
//
//  Created by Marie-Helene on 9/25/12.
//  Copyright (c) 2012 Marie-Helene. All rights reserved.
//

#import "CalculusBrain.h"

@interface CalculusBrain()
@property(nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculusBrain

@synthesize operandStack = _operandStack;

-(NSMutableArray *)operandStack{
    if(!_operandStack){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void)pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

-(double)popOperand{
    NSNumber *operandObject = self.operandStack.lastObject;
    if (operandObject) [self.operandStack removeLastObject]; //avoid index out of bounce
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand];
    } else if ([@"*" isEqualToString:operation]){
        result = [self popOperand] * [self popOperand];
    } else if ([operation isEqualToString:@"-"]){
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    } else if ([operation isEqualToString:@"/"]){
        double divisor = [self popOperand];
        if (divisor) result = [self popOperand] / divisor;
    }
    
    [self pushOperand:result];
    
    return result;
}

@end
