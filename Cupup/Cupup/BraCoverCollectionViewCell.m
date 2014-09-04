//
//  BraCoverCollectionViewCell.m
//  Cupup
//
//  Created by aypc on 14-9-3.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "BraCoverCollectionViewCell.h"

@implementation BraCoverCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:@"BraCoverCollectionViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}

-(void)loadUIWithBra:(BraDetailModel *)detailModel
{
    
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
