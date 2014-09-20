//
//  YACropImageView.m
//  YACropImageDemo
//
//  Created by aypc on 13-6-25.
//  Copyright (c) 2013年 aypc. All rights reserved.
//

#import "YACropImage.h"

@implementation YACropImage

UIImageView* imageView;

typedef enum {
    TOUCH_CROPVIEW = 1,
    TOUCH_BTN1,
    TOUCH_BTN2,
    TOUCH_BTN3,
    TOUCH_BTN4,
    TOUCH_DEFAULT
}TouchViewType;

CGRect cropRect;


UIImageView * cornerBtn1;
UIImageView * cornerBtn2;
UIImageView * cornerBtn3;
UIImageView * cornerBtn4;

TouchViewType currentTouchType;

CGPoint startPoint;

CGRect startCropRect;

UIView * shadowView;
UIImageView * cropImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWIthFrame:(CGRect)frame andImage:(UIImage *)image  withCornerImage:(UIImage *)cornerImage
{
    self = [self initWithFrame:frame];
    self.cornerImage = cornerImage;
    [self setUserInteractionEnabled:YES];
    [self setImage:image];
//    [self startCropImageFrom:CGRectMake(10, 10, 100, 100)];
//    self.backgroundColor = [UIColor grayColor];
    return self;
}

//将图片压缩以适应View

-(void)setImage:(UIImage *)image
{
    if (imageView == nil) {
        imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
    }
    
    CGSize imageSize = image.size;
    NSLog(@"%@,%@",NSStringFromCGRect(self.frame),NSStringFromCGSize(imageSize));
    
    
    if (imageSize.width/imageSize.height > self.frame.size.width/self.frame.size.height) {
          
        image = [self scaleFromImage:image toSize:CGSizeMake(self.frame.size.width,self.frame.size.width/imageSize.width*imageSize.height)];
        imageSize = image.size;
    }else
        {
            
            image = [self scaleFromImage:image toSize:CGSizeMake(self.frame.size.height/imageSize.height*imageSize.width, self.frame.size.height)];
            imageSize = image.size;
    }
    NSLog(@"%@",NSStringFromCGSize(imageSize));
    NSLog(@"%@",NSStringFromCGPoint(imageView.frame.origin));
    
    imageView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    NSLog(@"%@",NSStringFromCGPoint(imageView.frame.origin));
    imageView.center = CGPointMake(self.center.x - self.frame.origin.x, self.center.y - self.frame.origin.y);
    
    imageView.image = image;
    
    self.imageViewRect = imageView.frame;
    
}

//改变图片大小
- (UIImage *)scaleFromImage:(UIImage *) image toSize:(CGSize) size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(void)startCropImageFrom:(CGRect)croprect
{
    cropRect = croprect;
    
    if (shadowView == nil) {
        shadowView = [[UIView alloc]init];
        shadowView.frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
        shadowView.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.6];
        [imageView addSubview:shadowView];
    }
    
    if(cropImageView == nil)
    {
        cropImageView = [[UIImageView alloc]init];
        [imageView addSubview:cropImageView];
    }
    cropImageView.frame = cropRect;

    cropImageView.image = [self getImageFromImage:imageView.image withCropRect:cropRect];

    [self setImageCornerBtn];
}

//传入原始图片对象
-(UIImage *)getImageFromImage:(UIImage*) superImage withCropRect:(CGRect)rect
{    //定义裁剪的区域相对于原图片的位置
    CGRect subImageRect = rect;
    CGImageRef imageRef = superImage.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, subImageRect);
    UIGraphicsBeginImageContext(subImageRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, subImageRect, subImageRef);
    UIImage* subImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    //返回裁剪的部分图像
    return subImage;
    
}

//添加角按钮
-(void)setImageCornerBtn
{
    if (cornerBtn1 == nil) {
        cornerBtn1 = [[UIImageView alloc]initWithImage:self.cornerImage];
    }
//    cornerBtn1.image = self.cornerImage;
    cornerBtn1.tag = 101;
    cornerBtn1.center = CGPointMake(cropRect.origin.x , cropRect.origin.y 
                            );
    [cornerBtn1 setUserInteractionEnabled:YES];
    
    
    if (cornerBtn2 == nil) {
        cornerBtn2 = [[UIImageView alloc]initWithImage:self.cornerImage];
    }
//    cornerBtn2.image = self.cornerImage;
    cornerBtn2.tag = 102;
    cornerBtn2.center = CGPointMake(cropRect.origin.x + cropRect.size.width , cropRect.origin.y );
    [cornerBtn2 setUserInteractionEnabled:YES];
    
    if (cornerBtn3 == nil) {
        cornerBtn3 = [[UIImageView alloc]initWithImage:self.cornerImage];
    }
//    cornerBtn3.image = self.cornerImage;
    cornerBtn3.tag = 103;
    cornerBtn3.center = CGPointMake(cropRect.origin.x , cropRect.origin.y + cropRect.size.height );
    [cornerBtn3 setUserInteractionEnabled:YES];
    
    if (cornerBtn4 == nil) {
        cornerBtn4 = [[UIImageView alloc]initWithImage:self.cornerImage];
    }
//    cornerBtn4.image = self.cornerImage;
    cornerBtn4.tag = 104;
    cornerBtn4.center = CGPointMake(cropRect.origin.x + cropRect.size.width , cropRect.origin.y + cropRect.size.height );
    [cornerBtn4 setUserInteractionEnabled:YES];
    
    
    
    [imageView addSubview:cornerBtn1];
    
    [imageView addSubview:cornerBtn2];
    
    [imageView addSubview:cornerBtn3];
    
    [imageView addSubview:cornerBtn4];
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    
    startPoint = [touch locationInView:imageView];
    startCropRect = cropRect;
    if([self isTouchInCornerBtn:[touch locationInView:imageView]] > 0)
    {
        switch ([self isTouchInCornerBtn:[touch locationInView:imageView]]) {
            case 1:
                currentTouchType = TOUCH_BTN1;
                
                break;
            case 2:
                currentTouchType = TOUCH_BTN2;
                break;
            case 3:
                currentTouchType = TOUCH_BTN3;
                break;
            case 4:
                currentTouchType = TOUCH_BTN4;
                break;
                
            default:
                break;
        }
    }else if ([self isPoint:[touch locationInView:imageView] inRect:cropRect]) {
        NSLog(@"in");
        
        currentTouchType = TOUCH_CROPVIEW ;
        
    }else 
    {
        currentTouchType = TOUCH_DEFAULT;
    }
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    CGPoint currentPoint = [[touches anyObject] locationInView:imageView];
    if ([self isPoint:currentPoint inRect:imageView.bounds]) {
        switch (currentTouchType) {
            case TOUCH_CROPVIEW:
            {                cropRect = CGRectMake(startCropRect.origin.x + currentPoint.x - startPoint.x, startCropRect.origin.y + currentPoint.y - startPoint.y , cropRect.size.width, cropRect.size.height);
                
                if (cropRect.origin.x <= 0) {
                    cropRect = CGRectMake(0, cropRect.origin.y, cropRect.size.width, cropRect.size.height);
                }
                if (cropRect.origin.y <= 0) {
                    
                    cropRect = CGRectMake(cropRect.origin.x, 0 , cropRect.size.width, cropRect.size.height);
                }
                if (cropRect.origin.x + cropRect.size.width >= imageView.frame.size.width) {
                    cropRect = CGRectMake(imageView.frame.size.width - cropRect.size.width, cropRect.origin.y,cropRect.size.width, cropRect.size.height);
                }
                if (cropRect.origin.y + cropRect.size.height >= imageView.frame.size.height) {
                    cropRect = CGRectMake(cropRect.origin.x, imageView.frame.size.height - cropRect.size.height, cropRect.size.width, cropRect.size.height);
                }
                [self startCropImageFrom:cropRect];
                
            }
                break;
            case TOUCH_DEFAULT:
                
                break;
            case TOUCH_BTN1:
            {
                if (currentPoint.x - startCropRect.origin.x - startCropRect.size.width < -MIN_WIDTH && currentPoint.y - startCropRect.origin.y - startCropRect.size.height < -MIN_HEIGHT) {
                    
                    [self touchCornerBtn:currentTouchType currentPoint:currentPoint];
                }else if(currentPoint.x - startCropRect.origin.x - startCropRect.size.width >= - MIN_WIDTH && currentPoint.y - startCropRect.origin.y - startCropRect.size.height < -MIN_HEIGHT)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake(startCropRect.origin.x + startCropRect.size.width - MIN_WIDTH, currentPoint.y)];
                    NSLog(@"width");
                }else if (currentPoint.x - startCropRect.origin.x - startCropRect.size.width < -MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y - startCropRect.size.height >= -MIN_HEIGHT)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake( currentPoint.x , startCropRect.origin.y + startCropRect.size.height -MIN_HEIGHT)];
                    
                    NSLog(@"height");
                }
                
            }
                
                break;
            case TOUCH_BTN2:
            {
                if (currentPoint.x - startCropRect.origin.x > MIN_WIDTH && currentPoint.y - startCropRect.origin.y - startCropRect.size.height < -MIN_HEIGHT) {
                    
                    [self touchCornerBtn:currentTouchType currentPoint:currentPoint];
                    
                }else if (currentPoint.x - startCropRect.origin.x <= MIN_WIDTH && currentPoint.y - startCropRect.origin.y - startCropRect.size.height < -MIN_HEIGHT)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake(startCropRect.origin.x + MIN_WIDTH, currentPoint.y)];
                    
                }else if(currentPoint.x - startCropRect.origin.x > MIN_WIDTH && currentPoint.y - startCropRect.origin.y - startCropRect.size.height >= -MIN_HEIGHT)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake(currentPoint.x, startCropRect.origin.y + startCropRect.size.height - MIN_HEIGHT)];
                }
            }
                
                break;
            case TOUCH_BTN3:
            {
                if (currentPoint.x - startCropRect.origin.x - startCropRect.size.width < - MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y > MIN_WIDTH) {
                    
                    [self touchCornerBtn:currentTouchType currentPoint:currentPoint];
                    
                }else if(currentPoint.x - startCropRect.origin.x - startCropRect.size.width >= - MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y > MIN_WIDTH)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake( startCropRect.origin.x + startCropRect.size.width - MIN_WIDTH, currentPoint.y)];
                }else if(currentPoint.x - startCropRect.origin.x - startCropRect.size.width < - MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y <= MIN_WIDTH)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake(currentPoint.x, startCropRect.origin.y + MIN_WIDTH)];
                }
            }
                break;
            case TOUCH_BTN4:
            {
                if (currentPoint.x - startCropRect.origin.x > MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y > MIN_WIDTH) {
                    
                    [self touchCornerBtn:currentTouchType currentPoint:currentPoint];
                    
                }else if(currentPoint.x - startCropRect.origin.x <= MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y > MIN_WIDTH)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake(startCropRect.origin.x + MIN_WIDTH, currentPoint.y)];
                }else if(currentPoint.x - startCropRect.origin.x > MIN_WIDTH &&  currentPoint.y - startCropRect.origin.y <= MIN_WIDTH)
                {
                    [self touchCornerBtn:currentTouchType currentPoint:CGPointMake(currentPoint.x, startCropRect.origin.y + MIN_WIDTH)];
                }
            }
                break;
            default:
                break;
        }

    }
}

-(void)touchCornerBtn:(TouchViewType)touchType currentPoint:(CGPoint)point
{
    switch (touchType) {
        case TOUCH_BTN1:;
        {
            cropRect = CGRectMake(startCropRect.origin.x + point.x - startPoint.x , startCropRect.origin.y + point.y - startPoint.y, startCropRect.size.width - point.x + startPoint.x, startCropRect.size.height - point.y + startPoint.y);
        }
            break;
        case  TOUCH_BTN2:
        {
            cropRect = CGRectMake(startCropRect.origin.x, startCropRect.origin.y + point.y - startPoint.y, startCropRect.size.width + point.x - startPoint.x, startCropRect.size.height - point.y + startPoint.y);
        }
            break;
        case  TOUCH_BTN3:
        {
            cropRect = CGRectMake(startCropRect.origin.x + point.x - startPoint.x, startCropRect.origin.y, startCropRect.size.width + startPoint.x - point.x, startCropRect.size.height + point.y - startPoint.y);
        }
            break;
        case  TOUCH_BTN4:
        {
            cropRect = CGRectMake(startCropRect.origin.x, startCropRect.origin.y, startCropRect.size.width + point.x - startPoint.x, startCropRect.size.height + point.y - startPoint.y);
        }
            break;
            
        default:
            break;
    }
    
    [self startCropImageFrom:cropRect];

}


//判断是否点击在四角按钮上
-(int)isTouchInCornerBtn:(CGPoint)point
{
    
    
    if ([self isPoint:point inRect:cornerBtn1.frame]) {
        return 1;
    }else if([self isPoint:point inRect:cornerBtn2.frame])
    {
        return 2;
    }else if([self isPoint:point inRect:cornerBtn3.frame])
    {
        return 3;
    }else if([self isPoint:point inRect:cornerBtn4.frame])
    {
        return 4;
    }else
    {
        return -1;
    }
}
//判断是否点击在制定区域内
-(BOOL)isPoint:(CGPoint)point inRect:(CGRect)rect
{
    if (point.x >= rect.origin.x && point.y >= rect.origin.y && point.x <= rect.origin.x + rect.size.width && point.y <= rect.origin.y + rect.size.height) {
        return YES;
    }else
    {
        return NO;
    }
}

-(void)stopCropImage
{
    [shadowView removeFromSuperview];
    shadowView = nil;
    [cropImageView removeFromSuperview];
    cropImageView = nil;
    
    cropRect = CGRectMake(-1, -1, -1, -1);
    
    [cornerBtn1 removeFromSuperview];
    [cornerBtn2 removeFromSuperview];
    [cornerBtn3 removeFromSuperview];
    [cornerBtn4 removeFromSuperview];
    
}

-(UIImage *)getCroppedImage
{
    NSLog(@"~~~~%@",cropImageView);
    return cropImageView.image;
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
