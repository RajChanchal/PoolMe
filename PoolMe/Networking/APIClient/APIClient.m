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
    //Make Hamsburg coordinates
    CLLocationCoordinate2D point1 = CLLocationCoordinate2DMake(53.694865, 9.757589);
    CLLocationCoordinate2D point2 = CLLocationCoordinate2DMake(53.394655, 10.099891);
    return [APIClient fetchPOIsBetweenPoint1:point1 andPoint2:point2];
}
+(RACSignal *)fetchPOIsBetweenPoint1:(CLLocationCoordinate2D)point1 andPoint2:(CLLocationCoordinate2D)point2{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString *url = [self urlWithPoint1:point1 point2:point2];
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

+(NSString *)urlWithPoint1:(CLLocationCoordinate2D)point1 point2:(CLLocationCoordinate2D)point2{
    return [[NSString alloc]initWithFormat:@"%@/?p2Lat=%f&p1Lon=%f&p1Lat=%f&p2Lon=%f",baseURL,point2.latitude,point1.longitude,point1.latitude,point2.longitude];
}
@end
