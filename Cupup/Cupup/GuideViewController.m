//
//  GuideViewController.m
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "GuideViewController.h"
#import "UserInfoViewController.h"
@interface GuideViewController ()

@end

@implementation GuideViewController

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
    // Do any additional setup after loading the view.
    UIImageView * grilImage =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
    [grilImage setImage:[UIImage imageNamed:@""]];
    [self.view addSubview:grilImage];
    
    UIImageView * boyImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 240, 320, 240)];
    [boyImage setImage:[UIImage imageNamed:@""]];
    [self.view addSubview:boyImage];
    
    UIButton * grilBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    grilBtn.frame=CGRectMake(0, 0, 320, 240);
    grilBtn.tag=101;
    [grilBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:grilBtn];
    
    UIButton * boyBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    boyBtn.frame=CGRectMake(0, 240, 320, 240);
    boyBtn.tag=102;
    [boyBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boyBtn];
    
}

-(void)btnClick:(UIButton *)btn
{
    if (btn.tag==101)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"gril" forKey:@"sex"];
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"boy" forKey:@"sex"];
    }
    UserInfoViewController * userInfoVC=[[UserInfoViewController alloc] init];
    [self.navigationController pushViewController:userInfoVC animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
