//
//  iTunesConstants.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#ifndef iTunesConstants_h
#define iTunesConstants_h

#import <Foundation/Foundation.h>

#pragma mark: Storyboard constants

static NSString * const mainStoryboardName = @"Main";
static NSString * const searchResultCellIdentifier = @"resultCell";

#pragma mark: iTunes Search API constants

static NSString * const iTunesSearchUrlFormat = @"https://itunes.apple.com/search?term=%@&limit=%@";

static NSString * const jsonTagResults = @"results";
static NSString * const jsonTagArtistName = @"artistName";
static NSString * const jsonTagKind = @"kind";

#endif /* iTunesConstants_h */
