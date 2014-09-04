//
//  KonwOneSelfTwoViewController.m
//  Cupup
//
//  Created by 赵玄飞 on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "KonwOneSelfTwoViewController.h"
#import "KnowOneSelTwofViewController.h"
@interface KonwOneSelfTwoViewController ()

@end

@implementation KonwOneSelfTwoViewController

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
-(IBAction)twoBtnClick:(id)sender
{
    KnowOneSelTwofViewController * knowTVC = [[KnowOneSelTwofViewController alloc] init];
    [self.navigationController pushViewController:knowTVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
