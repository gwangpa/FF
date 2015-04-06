//
//  main.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Her.h"

int main(int argc, char * argv[]) {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstRobotPoint:CGPointMake(1, 2)
                                        firstRobotDirection:RobotDirectionN
                                          firstRobotCommand:@"LMLMLMLMM"
                                           secondRobotPoint:CGPointMake(3, 3)
                                       secondRobotDirection:RobotDirectionE
                                         secondRobotCommand:@"MMRMMRMRRM"];
    NSLog(@"RESULT : %@", result);

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
