//
//  KnowOneSelTwofViewController.m
//  Cupup
//
//  Created by 赵玄飞 on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "KnowOneSelTwofViewController.h"
#import "UserViewController.h"
@interface KnowOneSelTwofViewController ()

@end

@implementation KnowOneSelTwofViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnclick
{
    UserViewController * userVC=[[UserViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
}
@end
