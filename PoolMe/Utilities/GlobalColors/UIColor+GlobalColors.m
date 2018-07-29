//
//  UIColor+GlobalColors.m
//  PoolMe
//
//  Created by Chanchal Raj on 29/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "UIColor+GlobalColors.h"

@implementation UIColor (GlobalColors)
-(instancetype)initWithFleetType:(FleetType)fleetType{
    if ((self = [super init])) {
        switch (fleetType) {
            case FleetType_Taxi:
                self = [[UIColor alloc]initWithRed:255.0/255.0 green:212.0/255.0 blue:48.0/255.0 alpha:1];
                break;
            case FleetType_Pooling:
                self = [[UIColor alloc]initWithRed:122.0/255.0 green:210.0/255.0 blue:148.0/255.0 alpha: 1];
            default:
                break;
        }
    }
    return self;
}
@end
