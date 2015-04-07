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
                           firstSheepDogPoint:(CGPoint)firstSheepDogPoint
                       firstSheepDogDirection:(SheepDogDirection)firstSheepDogDirection
                         firstSheepDogCommand:(NSString *)firstSheepDogCommand
                          secondSheepDogPoint:(CGPoint)secondSheepDogPoint
                      secondSheepDogDirection:(SheepDogDirection)secondSheepDogDirection
                        secondSheepDogCommand:(NSString *)secondSheepDogCommand
{
    // pad doc
    PadDock *padDoc = [[PadDock alloc] initWithMaxPoint:padPoint];
    
    // first SheepDog
    SheepDog *firstSheepDog = [[SheepDog alloc] initWithPoint:firstSheepDogPoint direction:firstSheepDogDirection padDock:padDoc];
    
    // second SheepDog
    SheepDog *secondSheepDog = [[SheepDog alloc] initWithPoint:secondSheepDogPoint direction:secondSheepDogDirection padDock:padDoc];

    // order
    NSUInteger orderMax = firstSheepDogCommand.length > secondSheepDogCommand.length ? firstSheepDogCommand.length : secondSheepDogCommand.length;
    for (NSUInteger i = 0; i < orderMax; i++) {
        // make range
        NSRange range = NSMakeRange(i, 1);

        // order first SheepDog if possible
        if (i < firstSheepDogCommand.length) {
            NSString *command = [firstSheepDogCommand substringWithRange:range];
            if ([command isEqualToString:@"L"] == YES) {
                [firstSheepDog order:SheepDogOrderTypeTurnLeft];
            } else if ([command isEqualToString:@"R"] == YES) {
                [firstSheepDog order:SheepDogOrderTypeTurnRight];
            } else {
                [firstSheepDog order:SheepDogOrderTypeMove];
            }
        }

        // order second
        if (i < secondSheepDogCommand.length) {
            NSString *command = [secondSheepDogCommand substringWithRange:range];
            if ([command isEqualToString:@"L"] == YES) {
                [secondSheepDog order:SheepDogOrderTypeTurnLeft];
            } else if ([command isEqualToString:@"R"] == YES) {
                [secondSheepDog order:SheepDogOrderTypeTurnRight];
            } else {
                [secondSheepDog order:SheepDogOrderTypeMove];
            }
        }
    }
    
    // return SheepDogs' position
    return [NSString stringWithFormat:@"%@ %@", [firstSheepDog positionInfo], [secondSheepDog positionInfo]];
}

@end
