//
//  UILiveTile.m
//  UILiveTilesExamples
//
//  Created by Victor Ilisei on 7/6/14.
//  Copyright (c) 2014 Tech Genius. All rights reserved.
//

#import "UILiveTile.h"

@implementation UILiveTile

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupTableView];
    }
    return self;
}

// Public Methods
- (void)reloadContent {
    [scrollingTable reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)beginAnimatingLiveTileWithRandomDurationBetween:(NSTimeInterval)fastestSlideDurationTime and:(NSTimeInterval)slowestSlideDurationTime {
    fastestTime = fastestSlideDurationTime;
    slowestTime = slowestSlideDurationTime;
    setTime = 0.0f;
    [self resetTimer];
}

- (void)beginAnimatingLiveTileWithFixedDuration:(NSTimeInterval)slideDurationTime {
    fastestTime = 0.0f;
    slowestTime = 0.0f;
    setTime = slideDurationTime;
    [self resetTimer];
}

// Private Methods
- (void)setupTableView {
    scrollingTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    scrollingTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    scrollingTable.userInteractionEnabled = NO;
    scrollingTable.backgroundView = nil;
    scrollingTable.backgroundColor = self.backgroundColor;
    scrollingTable.delegate = self;
    scrollingTable.dataSource = self;
    [self addSubview:scrollingTable];
}

- (void)resetTimer {
    if (setTime > 0.0f) {
        @autoreleasepool {
            NSTimer *timer = [NSTimer timerWithTimeInterval:setTime target:self selector:@selector(moveSlide:) userInfo:nil repeats:YES];
            [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        }
    } else if (fastestTime > 0.0f && slowestTime > 0.0f) {
        #warning TODO
    }
}

- (IBAction)moveSlide:(NSTimer *)sender {
    @autoreleasepool {
        NSInteger currentRow = [[[scrollingTable indexPathsForVisibleRows] firstObject] row];
        if (currentRow + 1 == [scrollingTable numberOfRowsInSection:0]) {
            [scrollingTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        } else {
            [scrollingTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:currentRow+1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    }
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Each cell is size of view
    return tableView.frame.size.height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // No sections needed
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.content count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Invisible Selection
    @autoreleasepool {
        UIView *clearView = [[UIView alloc] initWithFrame:cell.selectedBackgroundView.frame];
        clearView.backgroundColor = [UIColor clearColor];
        cell.selectedBackgroundView = clearView;
    }
    
    // Unlimited subtitle lines
    cell.detailTextLabel.numberOfLines = 0;
    
    // Set cell content
    cell.imageView.image = [[self.content objectAtIndex:indexPath.row] objectForKey:@"slideImage"];
    cell.textLabel.text = [[self.content objectAtIndex:indexPath.row] objectForKey:@"slideTitle"];
    cell.detailTextLabel.text = [[self.content objectAtIndex:indexPath.row] objectForKey:@"slideContent"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.delegate liveTileDidSelectSlide:indexPath.row];
}

@end