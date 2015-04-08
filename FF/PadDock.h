//
//  PadDock.h
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SheepDog;

@interface PadDock : NSObject

// maximum x, y
@property (nonatomic, readonly) NSUInteger maxX;
@property (nonatomic, readonly) NSUInteger maxY;

// initialise
- (instancetype)initWithMaxPoint:(CGPoint)maxPoint;

// locate robot to pad dock
- (void)locateSheepDog:(SheepDog *)sheepDog;

// check if there is robot at point
- (SheepDog *)getSheepDogAtPoint:(CGPoint)point;

@end
