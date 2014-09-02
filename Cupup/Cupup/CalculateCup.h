//
//  CalculateCup.h
//  Cupup
//
//  Created by aypc on 14-9-2.
//  Copyright (c) 2014年 aypc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateCup : NSObject
+(CalculateCup *)shareInstance;
/**
 *  输入上下胸围正面胸型和侧面胸型，计算推荐类型
 *
 *  @param top       上胸围
 *  @param bottom    下胸围
 *  @param frontFlag 正面胸型，输入参数为1.2.3
 *  @param sideFloag 侧面胸型，输入参数为1.2.3
 *
 *  @return 字典类型，包含罩杯(cup)，推荐结果()
 */
-(NSDictionary *)calculateResultWithTop:(float) top andBottom:(float)bottom andFront:(int) frontFlag andSide:(int) sideFloag;
@end
