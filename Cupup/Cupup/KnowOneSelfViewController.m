//
//  KnowOneSelfViewController.m
//  Cupup
//
//  Created by 赵玄飞 on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "KnowOneSelfViewController.h"
#import "KonwOneSelfTwoViewController.h"
@interface KnowOneSelfViewController ()

@end

@implementation KnowOneSelfViewController

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
-(IBAction)btnClick:(id)sender
{
    KonwOneSelfTwoViewController * knowTVC=[[KonwOneSelfTwoViewController alloc] init];
    [self.navigationController pushViewController:knowTVC animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
