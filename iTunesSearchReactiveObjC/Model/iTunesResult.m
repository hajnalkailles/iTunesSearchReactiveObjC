//
//  iTunesResult.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesResult.h"

@implementation iTunesResult

- (id)init {
    if ( self = [super init] ) {
        self.searchString = @"";
        self.jsonDataObject = [[NSSet alloc] init];
    }
    return self;
}

- (id)initWithSearchString:(NSString *)searchString andJsonDataObject:(NSSet<iTunesJsonData *> *)jsonDataObject {
    if ( self = [super init] ) {
        self.searchString = searchString;
        self.jsonDataObject = jsonDataObject;
    }
    return self;
}

@end
