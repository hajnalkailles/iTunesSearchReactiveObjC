//
//  iTunesAbstractResultViewModel.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 16..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesAbstractResultViewModel.h"

@implementation iTunesAbstractResultViewModel

- (id)initWithResultModel:(iTunesResult *)resultModel {
    if ( self = [super init] ) {
        self.resultModel = resultModel;
        
        self.filterSignal = [[RACObserve(self, filterTuple)
                              map:^id(RACTuple *tuple) {
                                  UISearchBar *searchBar = tuple.first;
                                  self.filterKeyword = searchBar.text;
                                  return self.filterKeyword;
                              }] doNext:^(NSString *text) {
                                  if (text) {
                                      [self filterResults: text];
                                  } else {
                                      self.listToShow = [NSMutableArray arrayWithArray:[self.resultModel.jsonDataObject allObjects]];
                                  }
                              }];
    }
    return self;
}

- (void)filterResults:(NSString *)searchText {
    self.listToShow = [self.listToShow initWithArray:[NSArray array]];
}

- (NSString *)cellTitleWithIndex:(NSInteger)index {
    return @"Title";
}

- (NSString *)cellSubtitleWithIndex:(NSInteger)index {
    return @"Subtitle";
}

@end
