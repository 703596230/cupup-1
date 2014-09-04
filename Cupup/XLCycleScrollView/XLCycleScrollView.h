//
//  XLCycleScrollView.h
//  CycleScrollViewDemo
//
//  Created by xie liang on 9/14/12.
//  Copyright (c) 2012 xie liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XLCycleScrollViewDelegate;
@protocol XLCycleScrollViewDatasource;

@interface XLCycleScrollView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    
    UIImageView * pageControlImageView;
    NSInteger _totalPages;
    NSInteger _curPage;
    
    NSMutableArray *_curViews;
}

@property BOOL isNeedAutoScroll;
@property BOOL isDraggingScrollView;
@property float autoScrollInterval;

@property (nonatomic) BOOL isTimerStart;
@property (nonatomic, assign) NSTimer * autoScrollTimer;
@property (nonatomic,readonly) UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger currentPage;
@property (nonatomic,assign) id<XLCycleScrollViewDatasource> datasource;
@property (nonatomic,assign) id<XLCycleScrollViewDelegate> delegate;

- (void)reloadData;
- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index;
- (void)startAutoScroll;
- (void)endAutoScroll;
@end

@protocol XLCycleScrollViewDelegate <NSObject>

@optional
- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index;

@end

@protocol XLCycleScrollViewDatasource <NSObject>

@required
- (NSInteger)numberOfPages;
- (UIView *)cycleScrollView:(XLCycleScrollView *)cycleScrollView pageAtIndex:(NSInteger)index;

@end
