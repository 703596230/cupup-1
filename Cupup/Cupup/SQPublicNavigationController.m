//
//  SQPublicNavigationController.m
//  esvideo
//
//  Created by aypc on 14-4-1.
//  Copyright (c) 2014年 easou. All rights reserved.
//

#import "SQPublicNavigationController.h"
#import "APPMacro.h"
#import "ColorUtils.h"
#import "ImageUtilities.h"

#define navigation_button_title_alpha 0.7
#define navigation_left_text_button_center_x 20 //文字内容按钮中心点x坐标
#define navigation_left_button_center_x 10 //图片内容按钮中心点x坐标

@interface SQPublicNavigationController ()

@end

@implementation SQPublicNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.navigationBar.barTintColor = [ColorUtils colorWithHexString:orange_color];
        self.navigationBar.alpha = 1;
        
//        [self.navigationBar setBackgroundImage:[ImageUtilities createImageWithColor:[ColorUtils colorWithHexString:orange_color] withRect:CGRectMake(0, 0, 320, 64)] forBarMetrics:UIBarMetricsDefault];
        
        
        self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:navigation_title_font],NSFontAttributeName, [ColorUtils colorWithHexString:white_text_color] ,NSForegroundColorAttributeName,nil];
    }
    return self;
}


-(void)setLeftItem:(id)item
{
    for (UIView * v in self.navigationBar.subviews) {
        if (v.tag == 1) {
            [v removeFromSuperview];
        }
    }
    
    if (item != nil) {
        
        if ([item isKindOfClass:[UIImage class]])
        {
            UIImage * leftLogo = item;
            self.navigationItem.leftBarButtonItems = nil;
            UIImageView * imageView = [[UIImageView alloc]initWithImage:leftLogo];
            imageView.tag = 1;
            imageView.center = CGPointMake(navigation_left_image_left_spacing + leftLogo.size.width / 2, navigation_items_vertical_center);
            
            [self.navigationBar addSubview:imageView];
            [imageView release];
        }
        else if ([item isKindOfClass:[UIButton class]])
        {
            UIButton * btn = item;
            if (btn.titleLabel.text.length > 0) {
                btn.titleLabel.font = [UIFont boldSystemFontOfSize:navigation_button_title_font];
                [btn setTitleColor:[ColorUtils colorWithHexString:white_text_color] forState:UIControlStateNormal];
                [btn setTitleColor:[ColorUtils colorWithHexString:white_text_color andAlpha:navigation_button_title_alpha] forState:UIControlStateHighlighted];
                btn.center = CGPointMake( navigation_left_text_button_center_x , navigation_items_vertical_center);
            }else
            {
                btn.center = CGPointMake(navigation_left_button_left_spacing , navigation_items_vertical_center);
            }
            btn.tag = 1;
            [self.navigationBar addSubview:btn];
            
        }
    }
}

-(void)setRightItem:(id)items
{

    for (UIView * v in self.navigationBar.subviews) {
        if (v.tag == 2) {
            [v removeFromSuperview];
        }
    }
    
    if (items != nil) {
        NSArray * array = items;
        for (int i = 0; i < array.count ; i ++ )
        {
            UIButton * btn = [array objectAtIndex:i];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:navigation_button_title_font];
            [btn setTitleColor:[ColorUtils colorWithHexString:white_text_color] forState:UIControlStateNormal];
            [btn setTitleColor:[ColorUtils colorWithHexString:white_text_color andAlpha:navigation_button_title_alpha] forState:UIControlStateHighlighted];
            btn.tag = 2;
            btn.center = CGPointMake(297 - i * 50, navigation_items_vertical_center);
            [self.navigationBar addSubview:btn];
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLeftItemForDetailPage:(id)item
{
    for (UIView * view in self.navigationBar.subviews)
    {
        if (view.tag == 1000)  [view removeFromSuperview];
    }
    if (item != nil)
    {
        if ([item isKindOfClass:[UIButton class]])
        {
            UIButton * button = item;
            if (button.titleLabel.text.length > 0) {
                button.titleLabel.font = [UIFont boldSystemFontOfSize:navigation_button_title_font];
                [button setTitleColor:[ColorUtils colorWithHexString:white_text_color] forState:UIControlStateNormal];
                [button setTitleColor:[ColorUtils colorWithHexString:white_text_color andAlpha:navigation_button_title_alpha] forState:UIControlStateHighlighted];
                button.center = CGPointMake( navigation_left_text_button_center_x , navigation_items_vertical_center);
            }
            else
            {
                button.center = CGPointMake(navigation_left_button_left_spacing , navigation_items_vertical_center);
            }
            button.tag = 1000;
            [self.navigationBar addSubview:button];
        }
    }
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
