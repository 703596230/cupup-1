//
//  ClassifyDetailCollectionViewCell.m
//  Cupup
//
//  Created by aypc on 14-9-4.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "ClassifyDetailCollectionViewCell.h"

@implementation ClassifyDetailCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self = [[[NSBundle mainBundle] loadNibNamed:@"ClassifyDetailCollectionViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}
-(void)loadWithDic:(NSDictionary *)dic
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
