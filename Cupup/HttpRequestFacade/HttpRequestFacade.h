//
//  HttpRequestFacade.h
//  iUser
//
//  Created by System Administrator on 13-5-3.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequestFacade : NSObject

//refresh参数用于强制更新，禁用缓存
-(void) get:(NSString *)urlStr
completionBlock:(void (^)(NSString *json, NSError *err))completionBlock 
refresh:(BOOL)refresh useCacheIfNetworkFail:(BOOL)useCacheIfNetworkFail;


-(void) post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))comletionBlock params:(NSDictionary *)params;

-(void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock
 jsonString:(NSString *)jsonString ;

+(HttpRequestFacade *)sharedInstance;

@end
