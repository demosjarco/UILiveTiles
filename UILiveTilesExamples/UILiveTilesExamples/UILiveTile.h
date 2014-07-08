//
//  UILiveTile.h
//  UILiveTilesExamples
//
//  Created by Victor Ilisei on 7/6/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UILiveTileDelegate <NSObject>

- (void)liveTileDidSelectSlide:(NSInteger)slideNumber;

@end

@interface UILiveTile : UIView <UITableViewDelegate, UITableViewDataSource> {
    UITableView *scrollingTable;
    
    NSTimeInterval setTime;
    NSTimeInterval fastestTime;
    NSTimeInterval slowestTime;
}

@property (nonatomic, assign) id <UILiveTileDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *content;

- (void)reloadContent;
- (void)beginAnimatingLiveTileWithRandomDurationBetween:(NSTimeInterval)fastestSlideDurationTime and:(NSTimeInterval)slowestSlideDurationTime;
- (void)beginAnimatingLiveTileWithFixedDuration:(NSTimeInterval)slideDurationTime;

@end