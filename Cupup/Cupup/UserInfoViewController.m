//
//  UserInfoViewController.m
//  Cupup
//
//  Created by 赵玄飞 on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserViewController.h"
#import "KnowOneSelfViewController.h"
@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

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
    UIImageView * bgImage=[[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 300, 300)];
    [bgImage setImage:[UIImage imageNamed:@""]];
    [self.view addSubview:bgImage];
    
    UILabel * photoLabel =[[UILabel alloc] initWithFrame:CGRectMake(30, 40, 60, 20)];
    photoLabel.text=@"头像：";
    [self.view addSubview:photoLabel];
    
    self.photoImage =[[UIImageView alloc] initWithFrame:CGRectMake(250, 30, 40, 40)];
    
    UILabel * nameLabel  = [[UILabel alloc] initWithFrame:CGRectMake(30, 70, 60, 20)];
    nameLabel.text=@"用户名：";
    [self.view addSubview:nameLabel];
    
    self.nameField=[[UITextField alloc] initWithFrame:CGRectMake(100, 70, 150, 20)];
    [self.view addSubview:nameLabel];
    
    UILabel * sextitle =[[UILabel alloc] initWithFrame:CGRectMake(30, 100, 60, 20)];
    sextitle.text=@"性别：";
    [self.view addSubview:sextitle];
    
    self.sexLabel=[[UILabel alloc] initWithFrame:CGRectMake(100, 100, 150, 20)];
    [self.view addSubview:self.sexLabel];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"sex"] isEqualToString:@"gril"])
    {
        [self.photoImage setImage:[UIImage imageNamed:@""]];
        self.sexLabel.text=@"宇宙超级无敌大美女";
        [self addGrilsView];
    }
    else
    {
        [self.photoImage setImage:[UIImage imageNamed:@""]];
        self.sexLabel.text=@"宇宙超级无敌大帅哥";

    }
    
    UILabel * ageLabel =[[UILabel alloc] initWithFrame:CGRectMake(30, 130, 60, 20)];
    ageLabel.text=@"年龄：";
    [self.view addSubview:ageLabel];
    
    self.ageField =[[UITextField alloc] initWithFrame:CGRectMake(100, 130, 150, 20)];
    [self.view addSubview:self.ageField];
    
    UILabel * incomeLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 160, 150, 20)];
    incomeLabel.text=@"收入范围：";
    [self.view addSubview:incomeLabel];
    
    self.incomeField = [[UITextField alloc] initWithFrame:CGRectMake(100, 190, 150, 20)];
    [self.view addSubview:self.incomeField];

    
}

-(void)addGrilsView
{
    UIImageView * bgimageView =[[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 300, 200)];
    [bgimageView setImage:[UIImage imageNamed:@""]];
    [self.view addSubview:bgimageView];
    
    UILabel * upLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 220, 60, 20)];
    upLabel.text=@"上胸围：";
    [self.view addSubview:upLabel];
    
    UILabel * downLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 250, 60, 20)];
    downLabel.text=@"下胸围：";
    [self.view addSubview:downLabel];
    
    UIButton * grilsBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    grilsBtn.frame=CGRectMake(10, 200, 300, 200);
    [grilsBtn addTarget:self action:@selector(grilsBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:grilsBtn];
    
    
}
-(void)grilsBtnClick
{
    KnowOneSelfViewController * userVC=[[KnowOneSelfViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
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
