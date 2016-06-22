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

- (void)testCanHandleStringShorterThanLimit {
    
    NSString *inputString = @"foo";
    NSString *outString = @"foo";
    NSInteger wrapToLength = 10;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanHandleBogusLength {
    
    NSString *inputString = @"foo";
    NSString *outString = @"f\no\no";
    NSInteger wrapToLength = -1;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanWrapOnce {
    
    NSString *inputString = @"foo ber";
    NSString *outString = @"foo b\ner";
    NSInteger wrapToLength = 5;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanWrapTwice {
    
    NSString *inputString = @"foo ber";
    NSString *outString = @"foo\n be\nr";
    NSInteger wrapToLength = 3;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}


@end
