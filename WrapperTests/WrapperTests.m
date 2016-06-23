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
    NSString *outString = @"foo \nber";
    NSInteger wrapToLength = 5;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanWrapTwice {
    
    NSString *inputString = @"foo ber";
    NSString *outString = @"foo\n \nber";
    NSInteger wrapToLength = 3;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanWrapHyphen {
    
    NSString *inputString = @"foo-ber";
    NSString *outString = @"foo-\nber";
    NSInteger wrapToLength = 5;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanWrapMultipleHyphens {
    
    NSString *inputString = @"foo-ber Petunia-waffle";
    NSString *outString = @"foo-\nber \nPetun\nia-\nwaffl\ne";
    NSInteger wrapToLength = 5;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testCanWrapMultipleBreakingCharacters {
    
    NSString *inputString = @"foo-ber - Petunia-waffle";
    NSString *outString = @"foo-\nber -\n \nPetun\nia-\nwaffl\ne";
    NSInteger wrapToLength = 5;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

- (void)testlipsum {
    
    NSString *inputString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec feugiat tristique consequat. Vivamus lobortis turpis lorem, ut mattis elit interdum vitae. Cras velit turpis, lacinia in pulvinar id, viverra in erat. Sed non turpis ullamcorper, efficitur erat eget, semper turpis.";
    NSString *outString = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. \nDonec feugiat tristique consequat. Vivamus lobortis turpis \nlorem, ut mattis elit interdum vitae. Cras velit turpis, \nlacinia in pulvinar id, viverra in erat. Sed non turpis \nullamcorper, efficitur erat eget, semper turpis.";
    NSInteger wrapToLength = 60;
    
    NSString *result = [Wrapper wrap:inputString wrapLength:wrapToLength];
    
    XCTAssertEqualObjects(outString, result);
}

@end
