//
//  iTunesJsonData.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesJsonData.h"
#import <UIKit/UIKit.h>

@implementation iTunesJsonData

- (id)init {
    if ( self = [super init] ) {
        self.artistName = @"";
        self.trackName = @"";
        self.genreName = @"";
    }
    return self;
}

- (id)initWithArtistName:(NSString *)artistName trackName:(NSString *)trackName genreName:(NSString *)genreName {
    if ( self = [super init] ) {
        self.artistName = artistName;
        self.trackName = trackName;
        self.genreName = genreName;
    }
    return self;
}

@end
