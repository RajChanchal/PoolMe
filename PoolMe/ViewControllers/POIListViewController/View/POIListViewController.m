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

@interface POIListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property UIView *emptyListView;
@property (strong, nonatomic) POIListViewModel *viewModel;
@end

@implementation POIListViewController
#pragma mark - View Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.tblView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    self.emptyListView = [[[NSBundle mainBundle]loadNibNamed:@"EmptyTableView" owner:self options:nil]firstObject];
     [self bindViewModel];
}

#pragma mark - Utility Methods
-(void)bindViewModel{
    self.viewModel = [POIListViewModel new];
    [self.viewModel fetchHamburgPOIs];
     ///Fetch all the POIs near Hamburg
    [RACObserve(self.viewModel, hamburgPOIs) subscribeNext:^(NSArray*  _Nullable x) {
        if([x count]){self.tblView.backgroundView = nil;}
        else{
            self.tblView.backgroundView = self.emptyListView;
            self.emptyListView.center = self.view.center;
        }
        [self.tblView reloadData];
    } error:^(NSError * _Nullable error) {
        NSLog(@"Error: %@",error.localizedDescription);
    } completed:^{
        //NSLog(@"Fetched POIs");
    }];
    
}
#pragma mark - UITableViewDataSource
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    POICell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell configure:[self.viewModel viewModelForCellAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel totalPOIs];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 101;
}



@end
