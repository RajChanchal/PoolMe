//
//  APIClient.h
//  Awok
//
//  Created by Chanchal Raj on 24/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
NS_ASSUME_NONNULL_BEGIN

@interface APIClient : NSObject
/*! @brief Returns a signal which sends the POIs near Hamburg.*/
+(RACSignal *)fetchPOIsNearHamburg;
/*! @brief Fetches POIs between the between coordinates.
    @param  point1 One of the two points
    @param  point2 One of the two points
    @return Signal which subscribers can subscribe to get POIs near Hamburg
 */
+(RACSignal *)fetchPOIsBetweenPoint1:(CLLocationCoordinate2D)point1 andPoint2:(CLLocationCoordinate2D)point2;
/*! @brief Returns concatinated strig url by concating point1 and point2
    @param baseURL Base URL of the API end points
    @param point1 One of the two points
    @param  point2 One of the two points
    @return Returns a full API end point by concating params to base url
 */
+(NSString *)urlWithBaseURL:(NSString *)baseURL Point1:(CLLocationCoordinate2D)point1 point2:(CLLocationCoordinate2D)point2;
@end

NS_ASSUME_NONNULL_END
