//
//  UIImage+imagePlus.h
//  styler
//
//  Created by aypc on 13-10-10.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (imagePlus)
+(UIImage *)loadImageWithImageName:(NSString *)string;
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
+(UIImage*)getSubImage:(UIImage *)image rect:(CGRect)rect;
@end
