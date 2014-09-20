//
//  YACropImageClass.m
//  CropImageClass
//
//  Created by FaceUI on 13-6-18.
//  Copyright (c) 2013年 faceUI_anyi. All rights reserved.
//

#import "YACropImageClass.h"

@implementation YACropImageClass

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)setImage:(UIImage *)image
{
    if (imageCropperView) {
        
        [imageCropperView setImage:image];
    }
}
-(id)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor cyanColor];
    imageCropperView = [[NLImageCropperView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:imageCropperView];
    [imageCropperView setImage:image];
    return self;
}
-(void)addCropLayerWithFrame:(CGRect )rect
{
    [imageCropperView setCropRegionRect:rect];
}
-(UIImage *)getCroppedImage
{
    return [imageCropperView getCroppedImage];
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
