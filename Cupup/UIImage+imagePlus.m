
//
//  UIImage+imagePlus.m
//  styler
//
//  Created by aypc on 13-10-10.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import "UIImage+imagePlus.h"

@implementation UIImage (imagePlus)
+(UIImage *)loadImageWithImageName:(NSString *)string
{
    UIImage * image=[[UIImage alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x",string] ofType:@"png"]];
    return image;
}
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize

{
    
    UIImage *newimage;
    
    if (nil == image) {
        
        newimage = nil;
        
    }
    
    else{
        
        CGSize oldsize = image.size;
        
        CGRect rect;
        
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            
            rect.size.height = asize.height;
            
            rect.origin.x = (asize.width - rect.size.width)/2;
            
            rect.origin.y = 0;
            
        }
        
        else{
            
            rect.size.width = asize.width;
            
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            
            rect.origin.x = 0;
            
            rect.origin.y = (asize.height - rect.size.height)/2;
            
        }
        
        UIGraphicsBeginImageContext(asize);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));
        
        [image drawInRect:rect];
        
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
    }
    
    return newimage;
    
}
+(UIImage*)getSubImage:(UIImage *)image rect:(CGRect)rect
{
        //定义裁剪的区域相对于原图片的位置
        CGRect subImageRect = rect;
        CGImageRef imageRef = image.CGImage;
        CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, subImageRect);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextDrawImage(context, subImageRect, subImageRef);
        UIImage* subImage = [UIImage imageWithCGImage:subImageRef];
        UIGraphicsEndImageContext();
        //返回裁剪的部分图像
        return subImage;
}
@end
