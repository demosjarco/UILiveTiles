//
//  MainViewController.m
//  UILiveTilesExamples
//
//  Created by Victor Ilisei on 7/6/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Background color
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Setup arrays
    content = [[NSMutableArray alloc] init];
    [content addObject:@{@"slideTitle": @"BlahBlah", @"slideContent": @"BlahBlah asdfa sdf asdf as dfa sdf asd fa sdf asd f asdf asd f asdf as df asd fas df as df asdf a sdf asd fas df as df asdf asd fa sdf as df asd f asdf sad fa sdf asdf asd fas df asdf as df asdf asd f sadf sad fasd f asdf asd f asdf sd f sdf asd fa sdf asdf as dfas df asdf sad fs adf sadf sad fs daf sadf asd f sdaf sad fasd fs adf sad fs adf sd fsa df asdf as df sadf sad fas df sadf sad fs adf asd fas df asdf asd f asdf asd f asdf as df asdf as df asd f asdf as df asd f asdf asdf sa dfas f asdf ads f asdf asdf das fsad f adsf adsf das fsad fs daf asdf a sdf asdf asf sda fasd fa sdf sad fasd fasd dfas"}];
    [content addObject:@{@"slideTitle": @"BlahBlah1", @"slideContent": @"Muhahahahaha1"}];
    [content addObject:@{@"slideTitle": @"BlahBlah2", @"slideContent": @"Muhahahahaha2"}];
    
    // Place live tiles each 1/3 of screen height - full screen width
    self.liveTileTextImages = [[UILiveTile alloc] initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 300 / 2, self.view.bounds.size.height / 2 - 200 / 2, 300, 200)];
    [self.view addSubview:self.liveTileTextImages];
    self.liveTileTextImages.delegate = self;
    self.liveTileTextImages.content = content;
    [self.liveTileTextImages reloadContent];
    [self.liveTileTextImages beginAnimatingLiveTileWithFixedDuration:5.0f];
}

#pragma mark - <UILiveTileDelegate>

- (void)liveTileDidSelectSlide:(NSInteger)slideNumber {
    NSLog(@"Selected tile #%ld", (long)slideNumber);
    @autoreleasepool {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:[NSString stringWithFormat:@"Selected tile #%ld", (long)slideNumber] delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }
}

@end