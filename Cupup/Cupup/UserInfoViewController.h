//
//  UserInfoViewController.h
//  Cupup
//
//  Created by 赵玄飞 on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController<UIActionSheetDelegate>
@property(nonatomic,retain)UITextField * nameField;
@property(nonatomic,retain)UILabel * sexLabel;
@property(nonatomic,retain)UITextField * ageField;
@property(nonatomic,retain)UITextField * incomeField;
@property(nonatomic,retain)UIImageView *photoImage;
@end
