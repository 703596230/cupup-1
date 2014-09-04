//
//  BraCoverCollectionViewCell.h
//  Cupup
//
//  Created by aypc on 14-9-3.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BraDetailModel.h"
@interface BraCoverCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UIView *descriptionView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *likedCount;
@property (weak, nonatomic) IBOutlet UIImageView *priceIcon;
@property (weak, nonatomic) IBOutlet UIImageView *likedIcon;
@property (weak, nonatomic) IBOutlet UIView *discountView;
@property (weak, nonatomic) IBOutlet UIImageView *discountIcon;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;

-(void)loadUIWithBra:(BraDetailModel *)detailModel;
@end
