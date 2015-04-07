//
//  Her.h
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SheepDog.h"
#import "PadDock.h"

@interface Her : NSObject

+ (NSString *)startDemonstrateWithPadMaxPoint:(CGPoint)padPoint
                              firstSheepDogPoint:(CGPoint)firstSheepDogPoint
                          firstSheepDogDirection:(SheepDogDirection)firstSheepDogDirection
                            firstSheepDogCommand:(NSString *)firstSheepDogCommand
                             secondSheepDogPoint:(CGPoint)secondSheepDogPoint
                         secondSheepDogDirection:(SheepDogDirection)secondSheepDogDirection
                           secondSheepDogCommand:(NSString *)secondSheepDogCommand;

@end
