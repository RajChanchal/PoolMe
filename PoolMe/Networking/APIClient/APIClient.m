//
//  APIClient.m
//  Awok
//
//  Created by Chanchal Raj on 24/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "APIClient.h"
#import "Constants.h"
#import "NetworkManager.h"
#import "Poi.h"
@implementation APIClient
static NSString * baseURL = @"https://fake-poi-api.mytaxi.com";

+(RACSignal *)fetchPOIsNearHamburg{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString *url = [self urlByAPI:API.hamburg];
        RACSignal *signal = [NetworkManager RACGetJsonFromUrl:url parameters:nil];
        [signal subscribeNext:^(id  _Nullable x) {
            //NSLog(@"Next: %@",x);
            NSArray *poisArray = x[@"poiList"];
            if(poisArray){
                NSMutableArray *pois = [NSMutableArray new];
                for (NSDictionary* poiDic in poisArray){
                    Poi *poi = [[Poi alloc]initWithDictionary:poiDic];
                    [pois addObject:poi];
                }
                //NSLog(@"Total POIs %lu",(unsigned long)pois.count);
                [subscriber sendNext:pois];
            }
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
        } completed:^{
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
//+(RACSignal *)fetchHomeItems{
//    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        NSString *url = [self urlByAPI:API.home];
//        RACSignal *signal = [NetworkManager RACGetJsonFromUrl:url parameters:nil];
//        [signal subscribeNext:^(id  _Nullable x) {
//            NSLog(@"Next: %@",x);
//            if([x isKindOfClass:[NSDictionary class]]){
//                NSDictionary *responseDic = (NSDictionary *)x;
//                NSMutableArray *saletems = [NSMutableArray new];
//                for(NSDictionary *itemDic in responseDic[@"OUTPUT"][@"DATA"][@"ITEMS"]){
//                    Item *item = [[Item alloc]initWithDictionary:itemDic];
//                    [saletems addObject:item];
//                }
//                NSString * sectionHeader = responseDic[@"OUTPUT"][@"DATA"][@"TITLE"];
//                [subscriber sendNext:@{sectionHeader:saletems}];
//            }
//        } error:^(NSError * _Nullable error) {
//            [subscriber sendError:error];
//        } completed:^{
//            [subscriber sendCompleted];
//        }];
//        return nil;
//    }];
//}
+(NSString *)urlByAPI:(NSString *)api{
    return [[NSString alloc]initWithFormat:@"%@/%@",baseURL,api];
}
@end
