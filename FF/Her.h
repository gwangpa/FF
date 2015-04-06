//
//  Her.h
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Robot.h"
#import "PadDock.h"

@interface Her : NSObject

+ (NSString *)startDemonstrateWithPadMaxPoint:(CGPoint)padPoint
                              firstRobotPoint:(CGPoint)firstRobotPoint
                          firstRobotDirection:(RobotDirection)firstRobotDirection
                            firstRobotCommand:(NSString *)firstRobotCommand
                             secondRobotPoint:(CGPoint)secondRobotPoint
                         secondRobotDirection:(RobotDirection)secondRobotDirection
                           secondRobotCommand:(NSString *)secondRobotCommand;

@end
