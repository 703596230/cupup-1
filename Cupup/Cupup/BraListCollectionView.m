//
//  BraListCollectionView.m
//  Cupup
//
//  Created by aypc on 14-9-3.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "BraListCollectionView.h"
#import "BraListCollectionViewFlowLayout.h"
#import "BraCoverCollectionViewCell.h"
@implementation BraListCollectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame collectionViewLayout:[[BraListCollectionViewFlowLayout alloc] init]];
    if (self) {
        // Initialization code

        [self registerClass:[BraCoverCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        self.delegate = self;
        self.dataSource = self;
        
        
        self.braListArray = [[NSMutableArray alloc]initWithArray:@[@"",@"",@"",@"",@"",@"",@""]];
        [self reloadData];
        
    }
    return self;
}


-(void)loadCollectionViewWithUrl:(NSString *)url
{
    
}

#pragma mark - collectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.braListArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
//
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIndetifier = @"cell";
    BraCoverCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndetifier forIndexPath:indexPath];
    [cell loadUIWithBra:[self.braListArray objectAtIndex:indexPath.row]];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld",(long)indexPath.row);
    
//    SQVideoModel * videoIndex = [[[self.recommendArray  objectAtIndex:indexPath.section] objectForKey:@"items"] objectAtIndex:indexPath.row];
//    
//    NSLog(@"%@",videoIndex);
//    
//    SQVideoDetailViewController * vdvc = [[SQVideoDetailViewController alloc]init];
//    vdvc.inputVideoModel = videoIndex;
//    
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:[vdvc autorelease] animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
