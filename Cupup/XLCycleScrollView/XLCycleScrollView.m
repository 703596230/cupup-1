//
//  XLCycleScrollView.m
//  CycleScrollViewDemo
//
//  Created by xie liang on 9/14/12.
//  Copyright (c) 2012 xie liang. All rights reserved.
//

#import "XLCycleScrollView.h"
@implementation XLCycleScrollView

@synthesize scrollView = _scrollView;
@synthesize currentPage = _curPage;
@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

- (void)dealloc
{
    [_scrollView release];
    [_curViews release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(self.bounds.size.width * 3, self.bounds.size.height);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentOffset = CGPointMake(self.bounds.size.width, 0);
        _scrollView.pagingEnabled = YES;
        [self addSubview:_scrollView];
        
        CGRect rect = self.bounds;
        rect.origin.y = rect.size.height - 30;
        rect.size.height = 30;
        
        _curPage = 0;
    }
    return self;
}

-(void)initEventScrollViewPageControlWithPageCount:(int)count {
    
    if (!pageControlImageView) {
        pageControlImageView = [[UIImageView alloc]init];
        //    pageControlImageView.image = [ImageUtils imageFromImage:[UIImage loadImageWithImageName:@"indexpageBg"] andEdgeInsets:UIEdgeInsetsMake(0, 4, 0, 4)];
        pageControlImageView.backgroundColor = [UIColor clearColor];
        pageControlImageView.frame = CGRectMake( 0 , 0 ,count * 16 - 10, 10);
        pageControlImageView.center = CGPointMake(160, 135);
        [self addSubview:pageControlImageView];
    }
    
}

- (void)startAutoScroll
{
    if (!_isTimerStart) {
        self.autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.autoScrollInterval target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
        _isTimerStart = YES;
    }
}
- (void)endAutoScroll
{
    [self.autoScrollTimer invalidate];
    self.autoScrollTimer = nil;
    _isTimerStart = NO;
}

-(void)autoScroll
{
    [self.scrollView setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
}

-(void)setEventScrollViewPageControlHightLight:(int)index
{
    if (_totalPages > 1) {
        int count = _totalPages;
        for (UIView * v in pageControlImageView.subviews) {
            [v removeFromSuperview];
        }
        
        for (int i = 0; i < count ; i ++) {
            
            UIImageView * icon = [[UIImageView alloc]initWithFrame:CGRectMake(i * 16, 3, 7, 7)];
            if (i == index) {
                icon.image = [UIImage imageNamed:@"img_dot_orange"];
            }else
            {
                icon.image = [UIImage imageNamed:@"img_dot_white"];
                
            }
            
            [pageControlImageView addSubview:icon];
        }
        
        pageControlImageView.center = CGPointMake(160, 135);
    }
}

- (void)setDataource:(id<XLCycleScrollViewDatasource>)datasource
{
    _datasource = datasource;
    [self reloadData];
}

- (void)reloadData
{
    _totalPages = [_datasource numberOfPages];
    if (_totalPages == 0) {
        return;
    }else
    {
        if (_totalPages == 1) {
            
            _scrollView.contentSize = CGSizeMake(self.bounds.size.width , self.bounds.size.height);
        }
    }
    [self initEventScrollViewPageControlWithPageCount:_totalPages];
    [self loadData];
}

- (void)loadData
{
    [self setEventScrollViewPageControlHightLight:_curPage];
    
    //从scrollView上移除所有的subview
    NSArray *subViews = [_scrollView subviews];
    if([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    
    [self getDisplayImagesWithCurpage:_curPage];
    
    for (int i = 0; i < 3; i++) {
        UIView *v = [_curViews objectAtIndex:i];
        v.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                    action:@selector(handleTap:)];
        [v addGestureRecognizer:singleTap];
        [singleTap release];
        v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
        [_scrollView addSubview:v];
    }
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0)];
}

- (void)getDisplayImagesWithCurpage:(int)page {
    
    int pre = [self validPageValue:_curPage-1];
    int last = [self validPageValue:_curPage+1];
    
    if (!_curViews) {
        _curViews = [[NSMutableArray alloc] init];
    }
    
    
    [_curViews removeAllObjects];
    
    [_curViews addObject:[_datasource cycleScrollView:self pageAtIndex:pre]];
    [_curViews addObject:[_datasource cycleScrollView:self pageAtIndex:page]];
    [_curViews addObject:[_datasource cycleScrollView:self pageAtIndex:last]];
}

- (int)validPageValue:(NSInteger)value {
    
    
    if(value == -1)
    {
        value = _totalPages - 1;

    }
    if(value == _totalPages)
    {
        value = 0;
    }
    return value;
    
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    
    if ([_delegate respondsToSelector:@selector(didClickPage:atIndex:)]) {
        [_delegate didClickPage:self atIndex:_curPage];
    }
    
}

- (void)setViewContent:(UIView *)view atIndex:(NSInteger)index
{
    if (index == _curPage) {
        [_curViews replaceObjectAtIndex:1 withObject:view];
        for (int i = 0; i < 3; i++) {
            UIView *v = [_curViews objectAtIndex:i];
            v.userInteractionEnabled = YES;
            UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(handleTap:)];
            [v addGestureRecognizer:singleTap];
            [singleTap release];
            v.frame = CGRectOffset(v.frame, v.frame.size.width * i, 0);
            [_scrollView addSubview:v];
        }
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    int x = aScrollView.contentOffset.x;
    
    //往下翻一张
    if(x >= (2*self.frame.size.width)) {
        _curPage = [self validPageValue:_curPage+1];
        [self loadData];
    }
    
    //往上翻
    if(x <= 0) {
        _curPage = [self validPageValue:_curPage-1];
        [self loadData];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)aScrollView {
    
    [_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width, 0) animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self endAutoScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startAutoScroll];
}

@end
