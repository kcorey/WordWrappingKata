//
//  Wrapper.m
//  Wrapper
//
//  Created by Ken Corey on 22/06/2016.
//  Copyright © 2016 Ken Corey. All rights reserved.
//

#import "Wrapper.h"

@implementation Wrapper

+ (NSString *)wrap:(NSString *)inputString wrapLength:(NSInteger)wrapLength {

    if (!inputString
        || [inputString isEqualToString:@""]) {
        
        return inputString;
    }
    
    NSInteger workingLength = wrapLength;
    
    workingLength = fmax(1,workingLength);
    workingLength = fmin(workingLength,[inputString length]);
    
    
    
    NSString *head = [inputString substringToIndex:workingLength];
    NSString *tail = [self wrap:[inputString substringFromIndex:workingLength] wrapLength:wrapLength];
    
    tail = [tail length] > 0 ? [@"\n" stringByAppendingString:tail] : tail;
    
    return [NSString stringWithFormat:@"%@%@",head,tail];
}

@end
