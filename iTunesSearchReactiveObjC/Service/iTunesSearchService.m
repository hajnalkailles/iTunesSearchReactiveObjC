//
//  iTunesSearchService.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesConstants.h"
#import "iTunesResult.h"
#import "iTunesSearchService.h"

@interface iTunesSearchService()

@property (copy, nonatomic) NSString *searchText;

@end

@implementation iTunesSearchService

- (RACSignal *)iTunesSearchSignalForSearchTerm:(NSString *)searchTerm andLimit:(NSNumber *)limit {
    self.searchText = searchTerm;
    NSString *urlString = [NSString stringWithFormat:iTunesSearchUrlFormat, searchTerm, limit.stringValue];
    return [self signalFromRequestWithURL:urlString andTransform:^id(NSData *response) {
        return [self transformData:response];
        }];
}

- (iTunesResult *)transformData:(NSData *)data {
    NSDictionary *json = [NSDictionary new];
    iTunesResult *resultObject = [iTunesResult new];
    
    NSError *error = nil;
    json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (json) {
        NSArray *resultArray = [json objectForKey:jsonTagResults];
        NSMutableSet<iTunesJsonData *> *resultList = [[NSMutableSet alloc] init];
        iTunesJsonData *appendingItem = [iTunesJsonData new];
        
        for (NSDictionary *resultDictionary in resultArray) {
            NSString *artistName = [resultDictionary objectForKey:jsonTagArtistName];
            NSString *trackName = [resultDictionary objectForKey:jsonTagTrackName];
            NSString *genreName = [resultDictionary objectForKey:jsonTagGenreName];
            
            appendingItem = [[iTunesJsonData alloc] initWithArtistName:artistName trackName:trackName genreName:genreName];
            [resultList addObject:appendingItem];
        }
        
        resultObject = [[iTunesResult alloc] initWithSearchString:self.searchText andJsonDataObject:resultList];
    }
    
    return resultObject;
}

- (RACSignal *) signalFromRequestWithURL:(NSString *)requestURL andTransform:(id (^)(NSData *response))block {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
        
        RACSignal *successSignal = [self rac_signalForSelector:@selector(URLSession:dataTask:didReceiveData:)];
        
        [[[successSignal
           map:^id(RACTuple *tuple) {
               return tuple.third;
            }]
          map:block]
         subscribeNext:^(id x) {
            [subscriber sendNext:x];
            [subscriber sendCompleted];
        }];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
        NSURLSessionTask *task = [session dataTaskWithRequest:request];
        [task resume];
        
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
}

@end
