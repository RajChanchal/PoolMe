//
//  NetworkManager.h
//  Awok
//
//  Created by Chanchal Raj on 21/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
+(RACSignal *)RACGetJsonFromUrl:(NSString *)url parameters:(NSDictionary * _Nullable)parameters;
@end

NS_ASSUME_NONNULL_END
