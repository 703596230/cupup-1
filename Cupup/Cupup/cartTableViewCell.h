//
//  cartTableViewCell.h
//  Cupup
//
//  Created by 赵玄飞 on 14-9-1.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BraDetailModel.h"
@interface cartTableViewCell : UITableViewCell
@property(nonatomic,retain)UILabel * nameLabel;
@property(nonatomic,retain)UILabel * classlabel;
@property(nonatomic,retain)UILabel * sizeLabel;
@property(nonatomic,retain)UILabel * scoreLabel;
@property(nonatomic,retain)UILabel * priceLabel;
@property(nonatomic,retain)UIImageView * photoImage;
@property(nonatomic,retain)BraDetailModel * braModel;

@end
