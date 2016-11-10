//
//  iTunesSearchService.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSURLSession.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface iTunesSearchService : NSObject <NSURLSessionDataDelegate>

- (RACSignal *)iTunesSearchSignalForSearchTerm:(NSString *)searchTerm andLimit:(NSNumber *)limit;

@end
