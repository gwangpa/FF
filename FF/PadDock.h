//
//  PadDock.h
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Robot;

@interface PadDock : NSObject

// maximum x, y
@property (nonatomic, readonly) NSUInteger maxX;
@property (nonatomic, readonly) NSUInteger maxY;

// initialise
- (instancetype)initWithMaxPoint:(CGPoint)maxPoint;

// locate robot to pad dock
- (void)locateRobot:(Robot *)robot;

// check if there is robot at point
- (Robot *)getRobotAtPoint:(CGPoint)point;

@end
