//
//  Constants.h
//  Awok
//
//  Created by Chanchal Raj on 24/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, FleetType) {
    FleetType_Taxi = 1,
    FleetType_Pooling = 2,
};
extern const struct APIStruct
{
    __unsafe_unretained NSString *home;
    __unsafe_unretained NSString *hamburg;
} API;


NS_ASSUME_NONNULL_END
