//
//  WrapperTests.m
//  WrapperTests
//
//  Created by Ken Corey on 22/06/2016.
//  Copyright © 2016 Ken Corey. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Wrapper.h"

@interface WrapperTests : XCTestCase

@end

@implementation WrapperTests

- (void)testCanHandleNil {
    
    NSString *inputString;
    NSString *outString;
    
    XCTAssertEqual(outString, inputString);
}

- (void)testCanHandleEmptyString {
    
    NSString *inputString = @"";
    NSString *outString = @"";
    
    NSString *result = [Wrapper wrap:inputString wrapLength:1];
    
    XCTAssertEqualObjects(outString, result);
}

@end
