//
//  iTunesSearchViewModel.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "NavigationService.h"

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface iTunesSearchViewModel : NSObject

@property(strong, nonatomic) NSString *searchTerm;
@property(assign, nonatomic) NSInteger limit;
@property(strong, nonatomic) RACCommand *executeSearch;
@property(strong, nonatomic) RACSignal *validSearchSignal;
@property(strong, nonatomic) RACSignal *validLimitSignal;

- (id)initWithNavigationService:(NavigationService *)service;

@end
