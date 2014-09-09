//
//  FindViewController.h
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindBraTableViewCell.h"
@interface FindViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *findTableView;
@property (nonatomic, strong) NSMutableArray * findBraArray;
@end
