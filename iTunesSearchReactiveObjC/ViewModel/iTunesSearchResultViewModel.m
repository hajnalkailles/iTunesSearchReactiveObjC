//
//  iTunesSearchResultViewModel.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesSearchResultViewModel.h"

@implementation iTunesSearchResultViewModel

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
    return [[self.listToShow objectAtIndex:index] artistName];
}

@end
