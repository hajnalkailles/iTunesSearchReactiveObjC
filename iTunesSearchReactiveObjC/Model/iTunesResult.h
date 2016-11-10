//
//  iTunesResult.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iTunesJsonData.h"

@interface iTunesResult : NSObject

@property(copy, nonatomic) NSString *searchString;
@property(strong, nonatomic) NSSet<iTunesJsonData *> *jsonDataObject;

- (id)initWithSearchString:(NSString *)searchString andJsonDataObject:(NSSet<iTunesJsonData *> *)jsonDataObject;

@end
