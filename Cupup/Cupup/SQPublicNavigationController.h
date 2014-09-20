//
//  SQPublicNavigationController.h
//  esvideo
//
//  Created by aypc on 14-4-1.
//  Copyright (c) 2014年 easou. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SQPublicNavigationController : UINavigationController
@property (nonatomic, retain) UILabel * titleLabel;
-(void)setLeftItem:(id)item;
-(void)setRightItem:(id)items;
@end
