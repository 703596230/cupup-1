//
//  BraDetailModel.h
//  Cupup
//
//  Created by aypc on 14-8-29.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BraDetailModel : NSObject
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSArray * keyWords;
@property (nonatomic) float discount;
@property (nonatomic) float originPrice;
@property (nonatomic) float discountedPrice;
@property (nonatomic) int liked;
@property (nonatomic , retain) NSString * coverUrl;

@end
