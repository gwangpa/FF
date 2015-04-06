//
//  FFTests.m
//  FFTests
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Her.h"

@interface FFTests : XCTestCase

@end

@implementation FFTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Given test from them

- (void)test1 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionN
                                          firstRobotCommand:@"LMLMLMLMM"
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@"MMRMMRMRRM"];
    XCTAssertEqualObjects(result, @"1 3 N 5 1 E");
}

#pragma mark - Test for initial position, direction

- (void)initialPointDirection {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionN
                                          firstRobotCommand:@""
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@""];
    XCTAssertEqualObjects(result, @"1 2 N 3 3 E");
}

#pragma mark - Test turn left, right

- (void)testTurn01 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 1)
                                        firstRobotDirection:RobotDirectionW
                                          firstRobotCommand:@"RR"
                                           secondRobotPoint:CGPointMake(2, 2)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@"LL"];
    XCTAssertEqualObjects(result, @"1 1 E 2 2 W");
}

- (void)testTurn02 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 1)
                                        firstRobotDirection:RobotDirectionW
                                          firstRobotCommand:@"RLRLRL"
                                           secondRobotPoint:CGPointMake(2, 2)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@"LLLLRRRR"];
    XCTAssertEqualObjects(result, @"1 1 W 2 2 E");
}

#pragma mark - Test beyond pad doc

- (void)testBeyondPadDocForMaxX {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionE
                                          firstRobotCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@""];
    XCTAssertEqualObjects(result, @"5 2 E 3 3 E");
}

- (void)testBeyondPadDocForMaxY {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionN
                                          firstRobotCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@""];
    XCTAssertEqualObjects(result, @"1 5 N 3 3 E");
}

- (void)testBeyondPadDocForMinX {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionW
                                          firstRobotCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@""];
    XCTAssertEqualObjects(result, @"0 2 W 3 3 E");
}

- (void)testBeyondPadDocForMinY {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionS
                                          firstRobotCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@""];
    XCTAssertEqualObjects(result, @"1 0 S 3 3 E");
}

#pragma mark - Combinations

- (void)combination01 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionE
                                          firstRobotCommand:@"RLRLRLRLRLMMM"
                                           secondRobotPoint:CGPointMake(1, 1)
                                       secondRobotDirection:RobotDirectionN
                                         secondRobotCommand:@"MMMMMMMMMM"];
    XCTAssertEqualObjects(result, @"4 2 E 1 1 N");
}

- (void)combination02 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionE
                                          firstRobotCommand:@"RLRLRLRLRLMMM"
                                           secondRobotPoint:CGPointMake(1, 1)
                                       secondRobotDirection:RobotDirectionN
                                         secondRobotCommand:@"MMMMMMMMMMM"];
    XCTAssertEqualObjects(result, @"4 2 E 1 2 N");
}

@end
