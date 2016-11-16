//
//  iTunesSearchResultTableViewController.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesConstants.h"
#import "iTunesJsonData.h"
#import "iTunesSearchResultTableViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation iTunesSearchResultTableViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self bindViewModel];
}

- (void)bindViewModel {
    RAC(self.resultViewModel, filterTuple) = [self rac_signalForSelector:@selector(searchBar:textDidChange:) fromProtocol:@protocol(UISearchBarDelegate)];
    // delegate needs to be set after rac_signalForSelector is called or we need an empty implementation of the selector otherwise
    self.filterBar.delegate = self;
    
    [self.resultViewModel.filterSignal subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultViewModel.listToShow.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:searchResultCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.resultViewModel cellTitleWithIndex:indexPath.row];
    cell.detailTextLabel.text = [self.resultViewModel cellSubtitleWithIndex:indexPath.row];
    cell.detailTextLabel.textColor = [UIColor grayColor];
    
    return cell;
}

@end
