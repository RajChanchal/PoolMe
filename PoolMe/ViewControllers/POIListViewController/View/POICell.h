//
//  VehicleCell.h
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "POICellViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface POICell : UITableViewCell
-(void)configure:(POICellViewModel*)viewModel;
@end

NS_ASSUME_NONNULL_END
