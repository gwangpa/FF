//
//  PadDock.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import "PadDock.h"
#import "Robot.h"

@interface PadDock ()

@property (nonatomic, strong) NSMutableArray *robots;
@property (nonatomic, assign) NSUInteger maxX;
@property (nonatomic, assign) NSUInteger maxY;

@end

@implementation PadDock

- (instancetype)initWithMaxPoint:(CGPoint)maxPoint
{
    self = [super init];
    if (self) {
        self.robots = [NSMutableArray array];
        self.maxX = maxPoint.x;
        self.maxY = maxPoint.y;
    }
    return self;
}

- (void)locateRobot:(Robot *)robot
{
    [_robots addObject:robot];
}

- (Robot *)getRobotAtPoint:(CGPoint)point
{
    for (Robot *candidateRobot in _robots) {
        if (CGPointEqualToPoint(point, candidateRobot.currentPoint) == YES) {
            return candidateRobot;
        }
    }
    return nil;
}

@end
