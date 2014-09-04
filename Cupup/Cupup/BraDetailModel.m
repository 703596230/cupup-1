//
//  BraDetailModel.m
//  Cupup
//
//  Created by aypc on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "BraDetailModel.h"

@implementation BraDetailModel
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.keyWords = [aDecoder decodeObjectForKey:@"keyWords"];
    self.discount = [aDecoder decodeFloatForKey:@"discount"];
    self.originPrice = [aDecoder decodeFloatForKey:@"originPrice"];
    self.discountedPrice = [aDecoder decodeFloatForKey:@"discountedPrice"];
    self.liked = [aDecoder decodeIntForKey:@"liked"];
    self.coverUrl = [aDecoder decodeObjectForKey:@"coverUrl"];
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.keyWords forKey:@"keyWords"];
    [aCoder encodeFloat:self.discount forKey:@"discount"];
    [aCoder encodeFloat:self.originPrice forKey:@"originPrice"];
    [aCoder encodeFloat:self.discountedPrice forKey:@"discountedPrice"];
    [aCoder encodeInt:self.liked forKey:@"liked"];
    [aCoder encodeObject:self.coverUrl forKey:@"coverUrl"];
}

@end
