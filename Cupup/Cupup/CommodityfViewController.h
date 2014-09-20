//
//  CommodityfViewController.h
//  Cupup
//
//  Created by 赵玄飞 on 14-9-10.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "particularsView.h"
#import "parameterView.h"
<<<<<<< HEAD
#import "evaluateView.h"
=======
#import "evaluateView.m"
>>>>>>> 876ec9a6c138ff2fb093439dc744ba762ba283e5
#import "yourLikeView.h"
@interface CommodityfViewController : UIViewController
{
    parameterView * _parameterView;
    particularsView * _particularsView;
    evaluateView * _evaluateView;
    yourLikeView * _yourLikeView;
    
}

-(IBAction)particularsBtnClick:(id)sender;
-(IBAction)parameterBtnClick:(id)sender;
-(IBAction)evaluateBtnClick:(id)sender;
-(IBAction)youLikeBtnClick:(id)sender;
-(IBAction)LikeBtnClick:(id)sender;
-(IBAction)collectBtnClick:(id)sender;
-(IBAction)yshareBtnClick:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *bgScrollerView;

@end
