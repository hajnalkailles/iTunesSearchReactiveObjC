//
//  iTunesJsonData.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iTunesJsonData : NSObject

@property(copy, nonatomic) NSString *artistName;
@property(copy, nonatomic) NSString *mediaType;
@property(copy, nonatomic) NSString *trackName;

- (id)initWithArtistName:(NSString *)artistName mediaType:(NSString *)mediaType trackName:(NSString *)trackName;

@end
