//
//  CalculateCup.m
//  Cupup
//
//  Created by aypc on 14-9-2.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import "CalculateCup.h"

static CalculateCup * calcuateCup = nil;
@implementation CalculateCup

+(CalculateCup *)shareInstance
{
    if (calcuateCup == nil) {
        calcuateCup = [[CalculateCup alloc]init];
    }
    return calcuateCup;
}

-(NSDictionary *)calculateResultWithTop:(float) top andBottom:(float)bottom andFront:(int) frontFlag andSide:(int) sideFloag
{
    
    NSString * cup = [NSString stringWithFormat:@"%@%@",[self getFirstSizeFromBottom:bottom],[self getSecondCupWithTop:top andBottom:bottom]];
    
    NSDictionary * result = [[NSDictionary alloc]initWithObjectsAndKeys:cup,@"cup",[self getRecommendKeyWorsArrayWithFront:frontFlag andSide:sideFloag],@"keyWords", nil];
    
    return result;
}

-(NSString *)getFirstSizeFromBottom:(float)bottom
{
    NSString * result = @"";
    if (bottom >= 68 && bottom <= 72) {
        result = @"70";
    }else if (bottom >= 73 && bottom <= 77)
    {
        result = @"75";
    }else if (bottom >= 78 && bottom <= 82)
    {
        result = @"80";
    }else if (bottom >= 88 && bottom <= 92)
    {
        result = @"90";
    }
    return result;
}

-(NSString *)getSecondCupWithTop:(float)top andBottom:(float)bottom
{
    NSString *result = @"";
    
    float cup = top - bottom ;
    
    if (cup < 7.5) {
        result = @"AA";
    }else if (cup <= 10)
    {
        result = @"A";
    }else if (cup <= 12.5)
    {
        result = @"B";
    }else if (cup <= 15)
    {
        result = @"C";
    }else if (cup <= 17.5)
    {
        result = @"D";
    }else if (cup > 17.5)
    {
        result = @"E+";
    }
    
    return result;
}

-(NSArray * )getRecommendKeyWorsArrayWithFront:(int)frontFlag andSide:(int)sideFlag
{
    NSArray * keyWordsArray = [[NSArray alloc]init];
    if ((frontFlag == 1 && sideFlag == 1 )||(frontFlag == 1 && sideFlag == 2 )||(frontFlag == 2 && sideFlag == 1 )||(frontFlag == 2 && sideFlag == 2 )) {
        keyWordsArray = @[@"定型"];
    }else if ((frontFlag == 1 && sideFlag == 3 ) || (frontFlag == 2 && sideFlag == 3 ))
    {
        keyWordsArray = @[@"定型",@"上托",@"侧收"];
    }else if ((frontFlag == 3 && sideFlag == 1 ) || (frontFlag == 3 && sideFlag == 2 ))
    {
        keyWordsArray = @[@"聚拢",@"侧收",@"定型"];
    }else if ((frontFlag == 3 && sideFlag == 3 ))
    {
        keyWordsArray = @[@"聚拢",@"侧收",@"上托"];
    }
    return keyWordsArray;
}

@end
