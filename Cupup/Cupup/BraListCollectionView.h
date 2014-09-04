//
//  BraListCollectionView.h
//  Cupup
//
//  Created by aypc on 14-9-3.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BraListCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic ,retain) NSMutableArray * braListArray;
-(void)loadCollectionViewWithUrl:(NSString *)url;
@end
