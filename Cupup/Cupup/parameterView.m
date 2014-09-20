//
//  parameterView.m
//  Cupup
//
//  Created by 赵玄飞 on 14-9-10.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "parameterView.h"

@implementation parameterView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UILabel * titLabel1= [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 40, 15)];
        titLabel1.text=@"功能";
        [self addSubview:titLabel1];
       
        self.functionLabel =[[ UILabel alloc] initWithFrame:CGRectMake(100, 15, 100, 15)];
        self.functionLabel.font =[UIFont systemFontOfSize:14];
        [self addSubview:self.functionLabel];
        
        UILabel * titLabel2 =[[UILabel alloc] initWithFrame:CGRectMake(20, 45, 40, 15)];
        titLabel2.text=@"杯型";
        [self addSubview:titLabel2];
        
        self.cuoLabel =[[UILabel alloc] initWithFrame:CGRectMake(100, 45, 100, 15)];
        self.cuoLabel.font =[UIFont systemFontOfSize:14];
        [self addSubview:self.cuoLabel];
        
        
        
        UILabel * titLabel3 =[[UILabel alloc] initWithFrame:CGRectMake(20, 75, 40, 15)];
        titLabel3.text=@"面料";
        [self addSubview:titLabel3];
        
        self.liningLabel =[[UILabel alloc] initWithFrame:CGRectMake(100, 75, 100, 15)];
        [self addSubview:self.liningLabel];
        
        UILabel * titLabel4 =[[UILabel alloc] initWithFrame:CGRectMake(20, 105, 40, 15)];
        titLabel4.text=@"模杯厚度";
        [self addSubview:titLabel4];
        
        self.plyLabel =[[UILabel alloc] initWithFrame:CGRectMake(100, 105, 100, 15)];
        [self addSubview:self.plyLabel];
        
        
        for (int i = 0; i<4; i++)
        {
            UILabel * lineLabel =[[UILabel alloc] initWithFrame:CGRectMake(0, 35+i*30, 320, 1)];
            [self addSubview:lineLabel];
            
        }
        
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
