//
//  CartViewController.h
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,copy)UITableView * cartTableView;
@end
