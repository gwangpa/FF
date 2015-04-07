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
typedef NS_ENUM(NSInteger, SheepDogDirection) {
    SheepDogDirectionN = 0,
    SheepDogDirectionE = 1,
    SheepDogDirectionS = 2,
    SheepDogDirectionW = 3,
};

// order type
typedef NS_ENUM(NSInteger, SheepDogOrderType) {
    SheepDogOrderTypeTurnLeft,
    SheepDogOrderTypeTurnRight,
    SheepDogOrderTypeMove,
};

@class PadDock;

@interface SheepDog : NSObject

// current point, direction
@property (nonatomic, readonly) CGPoint currentPoint;
@property (nonatomic, readonly) SheepDogDirection direction;

// initialise
- (instancetype)initWithPoint:(CGPoint)point direction:(SheepDogDirection)direction padDock:(PadDock *)padDock;

// give order
- (void)order:(SheepDogOrderType)orderType;

// get position info string
- (NSString *)positionInfo;

@end
