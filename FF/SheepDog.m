//
//  Robot.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import "SheepDog.h"
#import "PadDock.h"

@interface SheepDog ()

@property (nonatomic, unsafe_unretained) PadDock *padDock;
@property (nonatomic, assign) CGPoint currentPoint;
@property (nonatomic, assign) CGPoint previousPoint;
@property (nonatomic, assign) SheepDogDirection currentDirection;

@end

@implementation SheepDog

- (instancetype)initWithPoint:(CGPoint)point direction:(SheepDogDirection)direction padDock:(PadDock *)padDock {
    self = [super init];
    if (self) {
        self.padDock = padDock;
        self.currentPoint = point;
        self.currentDirection = direction;
        [padDock locateSheepDog:self];
    }
    return self;
}

- (void)order:(SheepDogOrderType)orderType {
    switch (orderType) {
        case SheepDogOrderTypeTurnLeft:
            _currentDirection--;
            if (_currentDirection < SheepDogDirectionN) {
                _currentDirection = SheepDogDirectionW;
            }
            break;
            
        case SheepDogOrderTypeTurnRight:
            _currentDirection++;
            if (_currentDirection > SheepDogDirectionW) {
                _currentDirection = SheepDogDirectionN;
            }
            break;
            
        case SheepDogOrderTypeMove: {
            // destination point
            CGPoint destinationPoint = _currentPoint;
            
            // calculate to point
            switch (_currentDirection) {
                case SheepDogDirectionN:
                    destinationPoint.y += 1;
                    break;
                    
                case SheepDogDirectionE:
                    destinationPoint.x += 1;
                    break;
                    
                case SheepDogDirectionS:
                    destinationPoint.y -= 1;
                    break;
                    
                case SheepDogDirectionW:
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
            SheepDog *robotAtDestinationPoint = [_padDock getSheepDogAtPoint:destinationPoint];
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
        case SheepDogDirectionN:
            direction = @"N";
            break;
            
        case SheepDogDirectionE:
            direction = @"E";
            break;
            
        case SheepDogDirectionS:
            direction = @"S";
            break;
            
        case SheepDogDirectionW:
            direction = @"W";
            break;
    }
    return [NSString stringWithFormat:@"%d %d %@", (int)_currentPoint.x, (int)_currentPoint.y, direction];
}

@end
