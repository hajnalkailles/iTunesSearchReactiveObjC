//
//  iTunesSearchResultViewModel.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesResult.h"

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface iTunesSearchResultViewModel : NSObject

@property (strong, nonatomic) iTunesResult *resultModel;
@property (strong, nonatomic) NSMutableArray *listToShow;
@property (strong, nonatomic) RACTuple *filterTuple;
@property (strong, nonatomic) RACSignal *filterSignal;

- (id)initWithResultModel:(iTunesResult *)resultModel;

@end
