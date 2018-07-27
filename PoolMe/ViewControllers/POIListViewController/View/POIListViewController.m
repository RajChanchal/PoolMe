//
//  VehicleListViewController.m
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

#import "POIListViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Poi.h"
#import "POIListViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "POICell.h"

@interface POIListViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (strong, nonatomic) POIListViewModel *viewModel;
@end

@implementation POIListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
    [self.viewModel fetchHamburgPOIs];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    POICell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row = %ld",(long)indexPath.row];
    [cell configure:[self.viewModel viewModelForCellAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.hamburgPOIs.count;
}
-(void)bindViewModel{
    self.viewModel = [POIListViewModel new];
    [RACObserve(self.viewModel, hamburgPOIs) subscribeNext:^(id _) {
        [self.tblView reloadData];
    }];
}


@end
