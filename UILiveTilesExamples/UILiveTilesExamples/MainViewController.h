//
//  MainViewController.h
//  UILiveTilesExamples
//
//  Created by Victor Ilisei on 7/6/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "UILiveTile.h"

@interface MainViewController : UIViewController <UILiveTileDelegate> {
    NSMutableArray *content;
}

@property (nonatomic, strong) UILiveTile *liveTileText;
@property (nonatomic, strong) UILiveTile *liveTileImages;
@property (nonatomic, strong) UILiveTile *liveTileTextImages;

@end