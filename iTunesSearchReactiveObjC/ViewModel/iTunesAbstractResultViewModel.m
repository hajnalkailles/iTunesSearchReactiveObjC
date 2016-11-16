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

- (void) filterResults:(NSString *)searchText {
    NSMutableSet *filteredResults = [[NSMutableSet alloc] init];
    
    for (iTunesJsonData *object in self.resultModel.jsonDataObject) {
        if ([[object.trackName lowercaseString] containsString:[searchText lowercaseString]]) {
            [filteredResults addObject:object];
        }
    }
    
    if ((filteredResults.count < self.resultModel.jsonDataObject.count) && (![self.filterKeyword isEqualToString:@""])) {
        self.listToShow =  [NSMutableArray arrayWithArray:[filteredResults allObjects]];
    } else {
        self.listToShow = [NSMutableArray arrayWithArray:[self.resultModel.jsonDataObject allObjects]];
    }
}

- (NSString *)cellTitleWithIndex:(NSInteger)index {
    return [[self.listToShow objectAtIndex:index] trackName];
}

- (NSString *)cellSubtitleWithIndex:(NSInteger)index {
    return [[self.listToShow objectAtIndex:index] mediaType];
}

@end
