//
//  iTunesSearchViewController.h
//  iTunesSearchReactiveObjC
//
//  Created by Hajnalka Hegyi on 2016. 11. 09..
//  Copyright © 2016. Hajnalka Hegyi. All rights reserved.
//

#import "iTunesSearchViewModel.h"

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iTunesSearchViewController : UIViewController

@property (strong, nonatomic) iTunesSearchViewModel *searchViewModel;
@property (weak, nonatomic) IBOutlet UITextField *searchTermTextfield;
@property (weak, nonatomic) IBOutlet UITextField *limitTextfield;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@end
