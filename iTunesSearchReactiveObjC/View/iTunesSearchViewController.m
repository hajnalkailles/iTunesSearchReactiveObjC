//
//  iTunesSearchViewController.m
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesSearchViewController.h"

@implementation iTunesSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}

- (void)bindViewModel {
    RAC(self.searchViewModel, searchTerm) = [self.searchTermTextfield rac_textSignal];
    RAC(self.searchViewModel, limit) = [self.limitTextfield rac_textSignal];
    
    [self.searchViewModel.validSearchSignal subscribeNext:^(id valid) {
        BOOL isSignalValid = [valid boolValue];
        self.searchTermTextfield.backgroundColor = [self backgroundColorForValidState:isSignalValid];
    }];
    
    [self.searchViewModel.validLimitSignal subscribeNext:^(id valid) {
        BOOL isSignalValid = [valid boolValue];
        self.limitTextfield.backgroundColor = [self backgroundColorForValidState:isSignalValid];
    }];
    
    self.searchButton.rac_command = self.searchViewModel.executeSearch;
}

- (UIColor *)backgroundColorForValidState:(BOOL)valid {
    return valid ? [UIColor clearColor] : [UIColor redColor];
}

@end
