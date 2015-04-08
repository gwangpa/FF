//
//  PadDock.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import "PadDock.h"
#import "SheepDog.h"

@interface PadDock ()

@property (nonatomic, strong) NSMutableArray *sheepDogs;
@property (nonatomic, assign) NSUInteger maxX;
@property (nonatomic, assign) NSUInteger maxY;

@end

@implementation PadDock

- (instancetype)initWithMaxPoint:(CGPoint)maxPoint
{
    self = [super init];
    if (self) {
        self.sheepDogs = [NSMutableArray array];
        self.maxX = maxPoint.x;
        self.maxY = maxPoint.y;
    }
    return self;
}

- (void)locateSheepDog:(SheepDog *)sheepDog
{
    [_sheepDogs addObject:sheepDog];
}

- (SheepDog *)getSheepDogAtPoint:(CGPoint)point
{
    for (SheepDog *candidateSheepDog in _sheepDogs) {
        if (CGPointEqualToPoint(point, candidateSheepDog.currentPoint) == YES) {
            return candidateSheepDog;
        }
    }
    return nil;
}

@end
