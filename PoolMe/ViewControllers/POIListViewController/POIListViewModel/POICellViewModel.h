//
//  VehicleCellViewModel.h
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poi.h"
NS_ASSUME_NONNULL_BEGIN

@interface POICellViewModel : NSObject
- (instancetype)initWithPOI:(Poi *)poi;
@end

NS_ASSUME_NONNULL_END
