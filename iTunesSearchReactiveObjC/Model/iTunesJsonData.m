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
    }
    return self;
}

- (id)initWithArtistName:(NSString *)artistName andMediaType:(NSString *)mediaType {
    if ( self = [super init] ) {
        self.artistName = artistName;
        self.mediaType = mediaType;
    }
    return self;
}

@end
