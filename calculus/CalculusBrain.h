//
//  CalculusBrain.h
//  calculus
//
//  Created by Marie-Helene on 9/25/12.
//  Copyright (c) 2012 Marie-Helene. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculusBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@end
