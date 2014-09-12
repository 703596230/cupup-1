//
//  ClassifyViewController.m
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "ClassifyViewController.h"
#import "ClassifyDetailCollectionViewCell.h"
#import "ClassifyDetailCollectionViewFlowLayout.h"
#import "AppMacro.h"
@interface ClassifyViewController ()

@end

#define tableView_width 80

@implementation ClassifyViewController

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
    self.navigationItem.title = @"分类";
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadUI];
}

-(void)loadUI
{
    [self loadTableView];
    [self loadCollectionView];
}

-(void)loadTableView
{
    self.classifyTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, k_navigationBar_height + k_statusBar_height, tableView_width, SCREEN_HEIGHT - (k_statusBar_height + k_navigationBar_height + k_tabBar_height)) style:UITableViewStylePlain];
    [self.classifyTableView setShowsVerticalScrollIndicator:NO];
    self.classifyTableView.delegate = self;
    self.classifyTableView.dataSource = self;
    [self.view addSubview:_classifyTableView];
    [self.classifyTableView reloadData];
}

-(void)loadCollectionView
{
    self.classifyDetailCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(tableView_width, k_navigationBar_height + k_statusBar_height, SCREEN_WIDTH - tableView_width, SCREEN_HEIGHT - (k_statusBar_height + k_navigationBar_height + k_tabBar_height)) collectionViewLayout:[[ClassifyDetailCollectionViewFlowLayout alloc] init]];
    [self.classifyDetailCollectionView registerClass:[ClassifyDetailCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    self.classifyDetailCollectionView.delegate = self;
    self.classifyDetailCollectionView.dataSource = self;
    
    [self.view addSubview:_classifyDetailCollectionView];
    
    [self.classifyDetailCollectionView reloadData];
    
}

#pragma mark - tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    return self.classifyArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = @"111111111";
    return cell;
}

#pragma mark - collectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
//    return self.classifyDetailArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndetifier = @"cell";
    ClassifyDetailCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndetifier forIndexPath:indexPath];
    [cell loadWithDic:[self.classifyDetailArray objectAtIndex:indexPath.row]];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",(long)indexPath.row);
    
    //    SQVideoModel * videoIndex = [[[self.recommendArray  objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row];
    //
    //    NSLog(@"%@",videoIndex);
    //
    //    SQVideoDetailViewController * vdvc = [[SQVideoDetailViewController alloc]init];
    //    vdvc.inputVideoModel = videoIndex;
    //
    //    self.hidesBottomBarWhenPushed = YES;
    //    [self.navigationController pushViewController:[vdvc autorelease] animated:YES];
    //    self.hidesBottomBarWhenPushed = NO;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
