//
//  RecommendViewController.h
//  Cupup
//
//  Created by aypc on 14-8-27.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BraListCollectionView.h"
#import "XLCycleScrollView.h"
@interface RecommendViewController : UIViewController<XLCycleScrollViewDatasource,XLCycleScrollViewDelegate>
@property (strong, nonatomic) IBOutlet BraListCollectionView *braListCollectionView;
@property (strong, nonatomic) XLCycleScrollView * cycleScrollView;
@end
