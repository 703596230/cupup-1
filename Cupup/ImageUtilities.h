//
//  ImageUtilities.h
//  esvideo
//
//  Created by YangGaoming on 14-4-10.
//  Copyright (c) 2014年 easou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtilities : NSObject

+(UIImage *)createImageWithColor:(UIColor *)color;

//将颜色转化为图片
+(UIImage *)createImageWithColor:(UIColor *)color withRect:(CGRect) rect;

+(UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image;

//将UIView转成UIImage
-(UIImage *)getImageFromView:(UIView *)theView;

@end
