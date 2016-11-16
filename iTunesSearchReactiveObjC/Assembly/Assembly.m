//
//  Assembly.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 16..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "Assembly.h"
#import "iTunesConstants.h"
#import "iTunesExtendedResultViewModel.h"
#import "iTunesSearchResultTableViewController.h"
#import "iTunesSearchResultViewModel.h"

@implementation Assembly

- (id)resultTableViewController {
    return [TyphoonDefinition withClass:[iTunesSearchResultTableViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(instantiateViewControllerWithIdentifier:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:resultTableViewIdentifier];
        }];
        
        [definition injectProperty:@selector(resultViewModel) with:[self resultViewModel]];
    }];
}

- (id)resultViewModel {
    return [TyphoonDefinition withClass:[iTunesSearchResultViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithResultModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self resultModel]];
        }];
    }];
}

- (id)extendedResultViewModel {
    return [TyphoonDefinition withClass:[iTunesExtendedResultViewModel class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithResultModel:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self resultModel]];
        }];
    }];
}

- (id)resultModel {
    return [TyphoonDefinition withClass:[iTunesResult class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(init)];
    }];
}

@end
