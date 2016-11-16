//
//  iTunesAbstractResultViewModel.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 16..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesResult.h"

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface iTunesAbstractResultViewModel : NSObject

@property (strong, nonatomic) iTunesResult *resultModel;
@property (strong, nonatomic) NSMutableArray *listToShow;
@property (strong, nonatomic) RACTuple *filterTuple;
@property (strong, nonatomic) RACSignal *filterSignal;
@property (copy, nonatomic) NSString *filterKeyword;

- (id)initWithResultModel:(iTunesResult *)resultModel;
- (NSString *)cellTitleWithIndex:(NSInteger)index;
- (NSString *)cellSubtitleWithIndex:(NSInteger)index;

@end
