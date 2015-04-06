//
//  Robot.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import "Robot.h"
#import "PadDock.h"

@interface Robot ()

@property (nonatomic, weak) PadDock *padDock;
@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, assign) CGPoint previousPoint;
@property (nonatomic, assign) RobotDirection currentDirection;

@end

@implementation Robot

- (instancetype)initWithPoint:(CGPoint)point direction:(RobotDirection)direction padDock:(PadDock *)padDock {
    self = [super init];
    if (self) {
        self.padDock = padDock;
        self.currentPoint = point;
        self.currentDirection = direction;
        [padDock locateRobot:self];
    }
    return self;
}

- (void)order:(RobotOrderType)orderType {
    switch (orderType) {
        case RobotOrderTypeTurnLeft:
            _currentDirection--;
            if (_currentDirection < RobotDirectionN) {
                _currentDirection = RobotDirectionW;
            }
            break;
            
        case RobotOrderTypeTurnRight:
            _currentDirection++;
            if (_currentDirection > RobotDirectionW) {
                _currentDirection = RobotDirectionN;
            }
            break;
            
        case RobotOrderTypeMove: {
            // destination point
            CGPoint destinationPoint = _currentPoint;
            
            // calculate to point
            switch (_currentDirection) {
                case RobotDirectionN:
                    destinationPoint.y += 1;
                    break;
                    
                case RobotDirectionE:
                    destinationPoint.x += 1;
                    break;
                    
                case RobotDirectionS:
                    destinationPoint.y -= 1;
                    break;
                    
                case RobotDirectionW:
                    destinationPoint.x -= 1;
                    break;
            }
            
            // adjust point
            if (destinationPoint.x < 0) {
                destinationPoint.x = 0;
            }
            if (destinationPoint.y < 0) {
                destinationPoint.y = 0;
            }
            if (destinationPoint.x > _padDock.maxX) {
                destinationPoint.x = _padDock.maxX;
            }
            if (destinationPoint.y > _padDock.maxY) {
                destinationPoint.y = _padDock.maxY;
            }
            
            // check if there is another robot at the point
            Robot *robotAtDestinationPoint = [_padDock getRobotAtPoint:destinationPoint];
            if (robotAtDestinationPoint == nil || robotAtDestinationPoint == self) {
                self.currentPoint = destinationPoint;
            }
            break;
        }
    }
}

- (NSString *)positionInfo {
    NSString *direction = nil;
    switch (_currentDirection) {
        case RobotDirectionN:
            direction = @"N";
            break;
            
        case RobotDirectionE:
            direction = @"E";
            break;
            
        case RobotDirectionS:
            direction = @"S";
            break;
            
        case RobotDirectionW:
            direction = @"W";
            break;
    }
    return [NSString stringWithFormat:@"%d %d %@", (int)_currentPoint.x, (int)_currentPoint.y, direction];
}

@end
