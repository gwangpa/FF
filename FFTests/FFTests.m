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
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionN
                                          firstSheepDogCommand:@"LMLMLMLMM"
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@"MMRMMRMRRM"];
    XCTAssertEqualObjects(result, @"1 3 N 5 1 E");
}

#pragma mark - Test for initial position, direction

- (void)initialPointDirection {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionN
                                          firstSheepDogCommand:@""
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@""];
    XCTAssertEqualObjects(result, @"1 2 N 3 3 E");
}

#pragma mark - Test turn left, right

- (void)testTurn01 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 1)
                                        firstSheepDogDirection:SheepDogDirectionW
                                          firstSheepDogCommand:@"RR"
                                           secondSheepDogPoint:CGPointMake(2, 2)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@"LL"];
    XCTAssertEqualObjects(result, @"1 1 E 2 2 W");
}

- (void)testTurn02 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 1)
                                        firstSheepDogDirection:SheepDogDirectionW
                                          firstSheepDogCommand:@"RLRLRL"
                                           secondSheepDogPoint:CGPointMake(2, 2)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@"LLLLRRRR"];
    XCTAssertEqualObjects(result, @"1 1 W 2 2 E");
}

#pragma mark - Test beyond pad doc

- (void)testBeyondPadDocForMaxX {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionE
                                          firstSheepDogCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@""];
    XCTAssertEqualObjects(result, @"5 2 E 3 3 E");
}

- (void)testBeyondPadDocForMaxY {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionN
                                          firstSheepDogCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@""];
    XCTAssertEqualObjects(result, @"1 5 N 3 3 E");
}

- (void)testBeyondPadDocForMinX {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionW
                                          firstSheepDogCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@""];
    XCTAssertEqualObjects(result, @"0 2 W 3 3 E");
}

- (void)testBeyondPadDocForMinY {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionS
                                          firstSheepDogCommand:@"MMMMMMMMMMMMMMMMMMMMMMMMM"
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@""];
    XCTAssertEqualObjects(result, @"1 0 S 3 3 E");
}

#pragma mark - Combinations

- (void)combination01 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionE
                                          firstSheepDogCommand:@"RLRLRLRLRLMMM"
                                           secondSheepDogPoint:CGPointMake(1, 1)
                                       secondSheepDogDirection:SheepDogDirectionN
                                         secondSheepDogCommand:@"MMMMMMMMMM"];
    XCTAssertEqualObjects(result, @"4 2 E 1 1 N");
}

- (void)combination02 {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionE
                                          firstSheepDogCommand:@"RLRLRLRLRLMMM"
                                           secondSheepDogPoint:CGPointMake(1, 1)
                                       secondSheepDogDirection:SheepDogDirectionN
                                         secondSheepDogCommand:@"MMMMMMMMMMM"];
    XCTAssertEqualObjects(result, @"4 2 E 1 2 N");
}

@end
