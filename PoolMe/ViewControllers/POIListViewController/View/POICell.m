//
//  VehicleCell.m
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "POICell.h"
#import "PoolMe-Swift.h"
#import "UIColor+GlobalColors.h"
@interface POICell()
@property (weak, nonatomic) IBOutlet UILabel *lblFleetType;
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
    self.lblFleetType.text = self.viewModel.fleetTypeInfo;
    self.lblFleetType.backgroundColor = [[UIColor alloc]initWithFleetType:self.viewModel.fleetType];
}

@end
