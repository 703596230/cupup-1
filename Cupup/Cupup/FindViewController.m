//
//  FindViewController.m
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "FindViewController.h"
#import "AppMacro.h"
@interface FindViewController ()

@end

@implementation FindViewController

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
    self.navigationItem.title = @"发现";
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadUI];
}

-(void)loadUI
{
    [self initTableView];
}

-(void)initTableView
{
    _findTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, k_navigationBar_height + k_statusBar_height, 320, SCREEN_HEIGHT - (k_navigationBar_height + k_statusBar_height + k_tabBar_height))  style:UITableViewStylePlain];
    _findTableView.delegate = self;
    _findTableView.dataSource = self;
    [self.view addSubview:_findTableView];
    [_findTableView reloadData];
}


#pragma mark -
#pragma mark tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
//    return self.findBraArray.count;
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndentifier = @"cell";
    FindBraTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier ];
    if (!cell) {
        cell = [[FindBraTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    [cell loadUIWithDic:nil];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
