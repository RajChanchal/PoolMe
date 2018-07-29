//
//  VehicleCellViewModel.m
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "POICellViewModel.h"

@interface POICellViewModel()
@property Poi * poi;
@end
@implementation POICellViewModel
- (instancetype)initWithPOI:(Poi *)poi
{
    if ((self = [super init])) {
        _poi = poi;
    }
    return self;
}
-(NSString *)fleetTypeInfo{
    return self.poi.fleetType == FleetType_Taxi ? @"TAXI" : @"POOLING";
}
-(FleetType)fleetType{
    return self.poi.fleetType;
}
@end
