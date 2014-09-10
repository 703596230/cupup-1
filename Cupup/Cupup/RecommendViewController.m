//
//  RecommendViewController.m
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "RecommendViewController.h"
#import "AppMacro.h"
#import "GuideViewController.h"

#define banner_height 100

@interface RecommendViewController ()

@end

@implementation RecommendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"推荐";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadListCollectionView];
    [self loadTopScrollView];
}
-(void)loadTopScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [[XLCycleScrollView alloc]initWithFrame:CGRectMake(0, - banner_height, 320, banner_height)];
        _cycleScrollView.delegate = self;
        _cycleScrollView.datasource = self;
        _cycleScrollView.autoScrollInterval = 3.0f;
        [_braListCollectionView addSubview:_cycleScrollView];
        [_braListCollectionView setContentInset:UIEdgeInsetsMake(banner_height, 0, 0, 0)];
        
        [_cycleScrollView reloadData];
        [_cycleScrollView startAutoScroll];
    }
    
}

-(void)loadListCollectionView
{
    self.braListCollectionView = [[BraListCollectionView alloc]initWithFrame:CGRectMake(0, k_statusBar_height + k_navigationBar_height, SCREEN_WIDTH, SCREEN_HEIGHT - (k_statusBar_height + k_navigationBar_height + k_tabBar_height) )];
    [self.view addSubview:_braListCollectionView];
}

- (void)didClickPage:(XLCycleScrollView *)csView atIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:[vdvc autorelease] animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
}

- (NSInteger)numberOfPages
{
    return 5;
}

-(UIView *)cycleScrollView:(XLCycleScrollView *)cycleScrollView pageAtIndex:(NSInteger)index
{
    static NSArray * array = nil;
    array = [NSArray arrayWithObjects:[UIColor blackColor],[UIColor yellowColor],[UIColor blueColor],[UIColor purpleColor],[UIColor cyanColor], nil];
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:cycleScrollView.bounds];
    imageView.backgroundColor = [array objectAtIndex:index];
    
    return imageView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
