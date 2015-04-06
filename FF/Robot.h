//
//  Robot.h
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// direction
typedef NS_ENUM(NSInteger, RobotDirection) {
    RobotDirectionN = 0,
    RobotDirectionE = 1,
    RobotDirectionS = 2,
    RobotDirectionW = 3,
};

// order type
typedef NS_ENUM(NSInteger, RobotOrderType) {
    RobotOrderTypeTurnLeft,
    RobotOrderTypeTurnRight,
    RobotOrderTypeMove,
};

@class PadDock;

@interface Robot : NSObject

// current point, direction
@property (nonatomic, readonly) CGPoint currentPoint;
@property (nonatomic, readonly) RobotDirection direction;

// initialise
- (instancetype)initWithPoint:(CGPoint)point direction:(RobotDirection)direction padDock:(PadDock *)padDock;

// give order
- (void)order:(RobotOrderType)orderType;

// get position info string
- (NSString *)positionInfo;

@end
