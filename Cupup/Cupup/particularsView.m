//
//  particularsView.m
//  Cupup
//
//  Created by 赵玄飞 on 14-9-10.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "particularsView.h"

@implementation particularsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor=[UIColor blackColor];
        [self addSubview:self.titleLabel];
        
        self.contentLabel =[[UILabel alloc] init];
        self.contentLabel.lineBreakMode =  5;
        [self addSubview:self.contentLabel];
        
        self.photoLabel =[[ UILabel alloc] init];
        [self addSubview:self.photoLabel];
    }
    return self;
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
