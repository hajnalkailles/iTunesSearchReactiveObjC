//
//  NavigationService.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesSearchResultViewModel.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NavigationService : NSObject

- (id)initWithNavigationController:(UINavigationController *)navigationController;
- (void)pushViewWithModel:(iTunesResult *)model;

@end
