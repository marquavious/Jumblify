//
//  JumblifyViewControllerTests.m
//  Jumblify
//
//  Created by Marquavious on 1/7/17.
//  Copyright © 2017 Tuts+. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JumblifyViewController.h"


@interface JumblifyViewControllerTests : XCTestCase

@property (nonatomic) JumblifyViewController *vcToTest;

@end

@interface JumblifyViewController (Test)

- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *))completion;

@end

@implementation JumblifyViewControllerTests

- (void)setUp {
    [super setUp];
    self.vcToTest = [[JumblifyViewController alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)testReverseString
{
    NSString *originalString = @"himynameisandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"ydnasiemanymih";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}

- (void)testPerformanceReverseString {
    NSString *originalString = @"himynameisandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString];
    }];
}

- (void)testDoSomethingThatTakesSomeTime {
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

@end
