//
//  ColorUtils.h
//  iUser
//
//  Created by System Administrator on 13-4-13.
//  Copyright (c) 2013年 珠元玉睿ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorUtils : NSObject

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert andAlpha:(CGFloat)alpha;
@end
