//
//  FindBraTableViewCell.m
//  Cupup
//
//  Created by aypc on 14-9-10.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "FindBraTableViewCell.h"

@implementation FindBraTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"FindBraTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    return self;
}



-(void)loadUIWithDic:(NSDictionary *)dic
{
    self.backgroundColor = [UIColor grayColor];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
