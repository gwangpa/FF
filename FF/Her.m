//
//  Her.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import "Her.h"

@implementation Her

+ (NSString *)startDemonstrateWithPadMaxPoint:(CGPoint)padPoint
                              firstRobotPoint:(CGPoint)firstRobotPoint
                          firstRobotDirection:(RobotDirection)firstRobotDirection
                            firstRobotCommand:(NSString *)firstRobotCommands
                             secondRobotPoint:(CGPoint)secondRobotPoint
                         secondRobotDirection:(RobotDirection)secondRobotDirection
                           secondRobotCommand:(NSString *)secondRobotCommands
{
    // pad doc
    PadDock *padDoc = [[PadDock alloc] initWithMaxPoint:padPoint];
    
    // first robot
    Robot *firstRobot = [[Robot alloc] initWithPoint:firstRobotPoint direction:firstRobotDirection padDock:padDoc];
    
    // second robot
    Robot *secondRobot = [[Robot alloc] initWithPoint:secondRobotPoint direction:secondRobotDirection padDock:padDoc];

    // order
    NSUInteger orderMax = firstRobotCommands.length > secondRobotCommands.length ? firstRobotCommands.length : secondRobotCommands.length;
    for (NSUInteger i = 0; i < orderMax; i++) {
        // make range
        NSRange range = NSMakeRange(i, 1);

        // order first robot if possible
        if (i < firstRobotCommands.length) {
            NSString *command = [firstRobotCommands substringWithRange:range];
            if ([command isEqualToString:@"L"] == YES) {
                [firstRobot order:RobotOrderTypeTurnLeft];
            } else if ([command isEqualToString:@"R"] == YES) {
                [firstRobot order:RobotOrderTypeTurnRight];
            } else {
                [firstRobot order:RobotOrderTypeMove];
            }
        }

        // order second
        if (i < secondRobotCommands.length) {
            NSString *command = [secondRobotCommands substringWithRange:range];
            if ([command isEqualToString:@"L"] == YES) {
                [secondRobot order:RobotOrderTypeTurnLeft];
            } else if ([command isEqualToString:@"R"] == YES) {
                [secondRobot order:RobotOrderTypeTurnRight];
            } else {
                [secondRobot order:RobotOrderTypeMove];
            }
        }
    }
    
    // return robots' position
    return [NSString stringWithFormat:@"%@ %@", [firstRobot positionInfo], [secondRobot positionInfo]];
}

@end
