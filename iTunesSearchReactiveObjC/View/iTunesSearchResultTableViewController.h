//
//  iTunesSearchResultTableViewController.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesSearchResultViewModel.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iTunesSearchResultTableViewController : UITableViewController <UISearchBarDelegate>

@property (strong, nonatomic) iTunesSearchResultViewModel *resultViewModel;
@property (weak, nonatomic) IBOutlet UISearchBar *filterBar;

@end
