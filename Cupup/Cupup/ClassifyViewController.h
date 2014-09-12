//
//  ClassifyViewController.h
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassifyViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *classifyTableView;
@property (strong, nonatomic) IBOutlet UICollectionView *classifyDetailCollectionView;
@property (strong, nonatomic) NSMutableArray * classifyDetailArray;
@property (strong, nonatomic) NSMutableArray * classifyArray;
@end
