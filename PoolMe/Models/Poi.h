//
//  Poi.h
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "Constants.h"
NS_ASSUME_NONNULL_BEGIN
//We could use NSString as well instead of NSUInteger, but if our app is going to be multi-lingual, integer makes more sense

@interface Poi : NSObject
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) double heading;
@property (nonatomic, readonly) NSInteger poiID;
@property (nonatomic, assign, readonly) FleetType fleetType;
- (id)initWithDictionary:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
