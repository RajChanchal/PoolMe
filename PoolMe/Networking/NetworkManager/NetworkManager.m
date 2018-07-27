//
//  NetworkManager.m
//  Awok
//
//  Created by Chanchal Raj on 21/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(RACSignal *)RACGetJsonFromUrl:(NSString *)url parameters:(NSDictionary * _Nullable)parameters {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [manager.requestSerializer setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (responseObject){
                [subscriber sendNext:responseObject];
                [subscriber sendCompleted];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}
@end
