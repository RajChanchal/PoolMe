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
+(RACSignal *)fetchPOIsNearHamburg;
+(RACSignal *)fetchHomeItems;
@end

NS_ASSUME_NONNULL_END
