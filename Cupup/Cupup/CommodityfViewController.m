//
//  CommodityfViewController.m
//  Cupup
//
//  Created by 赵玄飞 on 14-9-10.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "CommodityfViewController.h"


@interface CommodityfViewController ()

@end

@implementation CommodityfViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _parameterView =[[parameterView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
        _particularsView =[[particularsView alloc] initWithFrame:CGRectMake(0, 0, 320, 150)];
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


-(IBAction)parameterBtnClick:(id)sender
{
    
}
-(IBAction)particularsBtnClick:(id)sender
{

}
-(IBAction)evaluateBtnClick:(id)sender
{

}

-(IBAction)youLikeBtnClick:(id)sender
{

}
-(IBAction)LikeBtnClick:(id)sender
{

}
-(IBAction)collectBtnClick:(id)sender
{

}
-(IBAction)yshareBtnClick:(id)sender
{
    
}

@end
