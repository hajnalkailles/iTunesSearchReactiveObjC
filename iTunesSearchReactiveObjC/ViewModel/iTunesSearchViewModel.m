//
//  iTunesSearchViewModel.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesResult.h"
#import "iTunesSearchResultViewModel.h"
#import "iTunesSearchService.h"
#import "iTunesSearchViewModel.h"

@interface iTunesSearchViewModel()

@property(strong, nonatomic) iTunesSearchService *searchService;
@property(strong, nonatomic) NavigationService *navigationService;

@end

@implementation iTunesSearchViewModel

- (id)initWithNavigationService:(NavigationService *)service {
    if ( self = [super init] ) {
        self.searchService = [iTunesSearchService new];
        self.navigationService = service;
        
        self.validSearchSignal = [[RACObserve(self, searchTerm)
                                   map:^id(NSString *text) {
                                       return @([self isSearchTermValid]);
                                   }] distinctUntilChanged];
        
        self.validLimitSignal = [[RACObserve(self, limit)
                                   map:^id(NSString *text) {
                                       return @([self isLimitValid]);
                                   }] distinctUntilChanged];
        
        RACSignal *combinedSignal = [RACSignal combineLatest: @[self.validSearchSignal, self.validLimitSignal]
                                                      reduce:^id(NSNumber* searchTerm, NSNumber* limit) {
                                                          return @([self isCombinedValidForFirst:[searchTerm boolValue] andSecond:[limit boolValue]]);
                                                      }];
        
        self.executeSearch = [[RACCommand alloc] initWithEnabled:combinedSignal
                                signalBlock:^RACSignal *(id input) {
                                    return  [self searchMediaInfo];
                                }];
        
    }
    return self;
}

- (BOOL)isSearchTermValid {
    return self.searchTerm.length > 3;
}

- (BOOL)isLimitValid {
    return (self.limit < 40) && (self.limit > 0);
}

- (BOOL)isCombinedValidForFirst:(BOOL) first andSecond:(BOOL) second {
    return (first && second) ? YES : NO;
}

- (RACSignal *)searchMediaInfo {
    return [[self.searchService iTunesSearchSignalForSearchTerm:self.searchTerm andLimit:@(self.limit)] doNext:^(iTunesResult *results) {
        [self.navigationService pushViewWithModel:results];
    }];
}

@end
