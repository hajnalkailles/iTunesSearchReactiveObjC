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
        self.mediaType = @"";
        self.trackName = @"";
    }
    return self;
}

- (id)initWithArtistName:(NSString *)artistName mediaType:(NSString *)mediaType trackName:(NSString *)trackName {
    if ( self = [super init] ) {
        self.artistName = artistName;
        self.mediaType = mediaType;
        self.trackName = trackName;
    }
    return self;
}

@end
