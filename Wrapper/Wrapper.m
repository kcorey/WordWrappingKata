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

    NSInteger workingLength = wrapLength;
    
    workingLength = fmax(1,workingLength);
    workingLength = fmin(workingLength,[inputString length]);
    
    if (!inputString
        || [inputString isEqualToString:@""]
        || [inputString length] <= workingLength) {
        
        return inputString;
    }
    
    NSCharacterSet *specialChars = [NSCharacterSet characterSetWithCharactersInString:@" -"];
    
    NSString *head = [inputString substringToIndex:workingLength];

    NSRange range = [head rangeOfCharacterFromSet:specialChars options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        
        workingLength = range.location+1;
        workingLength = fmin(workingLength,[head length]);
        head = [head substringToIndex:workingLength];
    }
    
    NSString *tail = [self wrap:[inputString substringFromIndex:workingLength] wrapLength:wrapLength];
    
    tail = [tail length] > 0 ? [@"\n" stringByAppendingString:tail] : tail;
    
    return [NSString stringWithFormat:@"%@%@",head,tail];
}

@end
