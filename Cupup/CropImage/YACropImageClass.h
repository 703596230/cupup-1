//
//  YACropImageClass.h
//  CropImageClass
//
//  Created by FaceUI on 13-6-18.
//  Copyright (c) 2013年 faceUI_anyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLImageCropperView.h"
@interface YACropImageClass : UIImageView
{
    NLImageCropperView *imageCropperView;
}
-(id)initWithFrame:(CGRect)frame andImage:(UIImage *)image;
-(void)addCropLayerWithFrame:(CGRect )rect;
-(UIImage *)getCroppedImage;
-(void)setImage:(UIImage *)image;
@end
