//
//  CarListViewModel.h
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "POICellViewModel.h"
#import "APIClient.h"
NS_ASSUME_NONNULL_BEGIN

@interface POIListViewModel : NSObject

@property NSArray *hamburgPOIs;
/*! @brief Calls POIs API with Hamburg coordinates .
    @return Returns events stream to POIs data
 */
-(void)fetchHamburgPOIs;
-(NSUInteger)totalPOIs;
-(POICellViewModel *)viewModelForCellAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
