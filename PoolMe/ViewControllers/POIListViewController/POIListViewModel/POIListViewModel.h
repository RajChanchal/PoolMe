//
//  CarListViewModel.h
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POICellViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface POIListViewModel : NSObject
@property NSArray *hamburgPOIs;
-(void)fetchHamburgPOIs;
-(POICellViewModel *)viewModelForCellAtIndex:(int)index;
@end

NS_ASSUME_NONNULL_END
