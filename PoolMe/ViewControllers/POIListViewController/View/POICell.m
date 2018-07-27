//
//  VehicleCell.m
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "POICell.h"
@interface POICell()
@property POICellViewModel *viewModel;
@end
@implementation POICell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)configure:(POICellViewModel*)viewModel{
    _viewModel = viewModel;
    //Assign UI VAlues with the help of viewmodel
    
}

@end
