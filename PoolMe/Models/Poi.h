//
//  Poi.h
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN
//typedef enum : NSInteger {
//    taxi,
//    pooling
//} FleetType;
typedef NS_ENUM(NSUInteger, FleetType) {
    FleetType_Taxi = 1,
    FleetType_Pooling = 2,
};
@interface Poi : NSObject
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) double heading;
@property (nonatomic, readonly) NSInteger poiID;
@property (nonatomic, assign, readonly) FleetType fleetType;
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
