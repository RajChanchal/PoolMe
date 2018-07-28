//
//  CarListViewModel.m
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "POIListViewModel.h"
#import "APIClient.h"

@implementation POIListViewModel

-(void)fetchHamburgPOIs{
    RACSignal *signal = [APIClient fetchPOIsNearHamburg];
    [signal subscribeNext:^(NSArray*  _Nullable x) {
        self.hamburgPOIs = x;
        NSLog(@"Total POIs %ld",self.hamburgPOIs.count);
    } error:^(NSError * _Nullable error) {
        NSLog(@"Error: %@",error.localizedDescription);
    } completed:^{
        NSLog(@"Fetched all messages.");
    }];
}
-(POICellViewModel *)viewModelForCellAtIndex:(NSInteger)index{
    return [[POICellViewModel alloc]initWithPOI: self.hamburgPOIs[index]];
}
@end
