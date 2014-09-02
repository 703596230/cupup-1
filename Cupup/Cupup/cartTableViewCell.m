//
//  cartTableViewCell.m
//  Cupup
//
//  Created by 赵玄飞 on 14-9-1.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "cartTableViewCell.h"

@implementation cartTableViewCell

- (void)awakeFromNib
{
    // Initialization code
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textColor =[UIColor blackColor];
    [self addSubview:self.nameLabel];
    
    self.photoImage =[[UIImageView alloc] init];
    [self addSubview:self.photoImage];
    
    self.classlabel =[[UILabel alloc] initWithFrame:CGRectMake(50, 30, 20, 15)];
    [self addSubview:self.classlabel];
    
    self.sizeLabel = [[UILabel alloc] init];
    [self addSubview:self.sizeLabel];
    
    self.scoreLabel =[[UILabel alloc] init];
    [self addSubview:self.scoreLabel];
    
    self.priceLabel =[[UILabel alloc] init];
    [self addSubview:self.priceLabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
