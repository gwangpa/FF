//
//  main.m
//  FF
//
//  Created by Daniel KIM on 3/04/2015.
//  Copyright (c) 2015 GwangpaDotCom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Her.h"

int main(int argc, char * argv[]) {
    NSString *result = [Her startDemonstrateWithPadMaxPoint:CGPointMake(5, 5)
                                            firstSheepDogPoint:CGPointMake(1, 2)
                                        firstSheepDogDirection:SheepDogDirectionN
                                          firstSheepDogCommand:@"LMLMLMLMM"
                                           secondSheepDogPoint:CGPointMake(3, 3)
                                       secondSheepDogDirection:SheepDogDirectionE
                                         secondSheepDogCommand:@"MMRMMRMRRM"];
    NSLog(@"RESULT : %@", result);

    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
