//
//  BraListCollectionViewFlowLayout.m
//  Cupup
//
//  Created by aypc on 14-9-3.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "BraListCollectionViewFlowLayout.h"

@implementation BraListCollectionViewFlowLayout
#define ITEM_WIDTH 117
#define ITEM_HEIGHT 213

-(id)init
{
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT);
        //排列方向
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(8, 10, 15, 10);
//        self.headerReferenceSize = CGSizeMake(1, 13);
        //行间隔
        self.minimumLineSpacing = 15;
        self.minimumInteritemSpacing = 0;
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)oldBounds
{
    return YES;
}
@end
