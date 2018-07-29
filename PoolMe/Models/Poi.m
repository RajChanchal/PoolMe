//
//  Poi.m
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "Poi.h"

@implementation Poi
- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [self init];
    if (self == nil) return nil;
    _poiID = [dictionary[@"id"]integerValue];
    _heading = [dictionary[@"heading"]doubleValue];
    NSString *fleetTypeValue = dictionary[@"fleetType"];
    if([fleetTypeValue isEqualToString:@"POOLING"]){
        _fleetType = FleetType_Pooling;
    }else{
        _fleetType = FleetType_Taxi;
    }
    double latitude = [dictionary[@"coordinate"][@"latitude"]doubleValue];
    double longitude = [dictionary[@"coordinate"][@"longitude"]doubleValue];
    _coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    return self;
}
@end
