//
//  HttpRequestFacade.m
//  iUser
//
//  Created by System Administrator on 13-5-3.
//  Copyright (c) 2013年 mlzj. All rights reserved.
//

#import "HttpRequestFacade.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@implementation HttpRequestFacade


-(void)get:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock refresh:(BOOL)refresh useCacheIfNetworkFail:(BOOL)useCacheIfNetworkFail
{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@",urlStr]];
    //NSLog(@"request url:%@", url);
    ASIHTTPRequest *_request = [ASIHTTPRequest requestWithURL:url];
    [_request setCachePolicy:ASIAskServerIfModifiedWhenStaleCachePolicy|ASIFallbackToCacheIfLoadFailsCachePolicy];
    [_request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    
    //[_request setDownloadDestinationPath:[[ASIDownloadCache sharedCache] pathToStoreCachedResponseDataForRequest:_request]];
    //[_request setCachePolicy:ASIDoNotReadFromCacheCachePolicy];
    
    if(refresh){
        [_request setCachePolicy:ASIDoNotReadFromCacheCachePolicy|ASIFallbackToCacheIfLoadFailsCachePolicy];
    }
     ASIHTTPRequest *request = _request;
    [request setCompletionBlock:^
     {
         NSString *responseString = [request responseString];
         completionBlock(responseString, nil);
     }];
    
    [request setFailedBlock:^{
        NSError *err = [request error];
        NSLog(@"request faild:%@", err);
        //如果设置了当网路失败时使用缓存
        if(useCacheIfNetworkFail){
            ASIHTTPRequest *_request = [ASIHTTPRequest requestWithURL:url];
//            [_request addRequestHeader:@"User-Agent" value:[[AppStatus sharedInstance] ua]];
            [_request setCachePolicy:ASIDontLoadCachePolicy];
            ASIHTTPRequest *requestCache = _request;
            [requestCache setCompletionBlock:^{
                 NSString *responseString = [requestCache responseString];
                if (responseString == nil || [responseString isEqualToString:@""]) {
                    NSMutableDictionary *errUserInfo = [[NSMutableDictionary alloc] init];
                    completionBlock(nil, err);
                }else{
                  completionBlock(responseString, nil);
                }
             }];
            
            [requestCache setFailedBlock:^{
                completionBlock(nil, err);
            }];
            [requestCache startAsynchronous];
        }else{
        }
        
    }];
    [request startAsynchronous];
}


-(void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock
     params:(NSDictionary *)params{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@",urlStr]];
    ASIFormDataRequest *_request = [ASIFormDataRequest requestWithURL:url];
//    [_request addRequestHeader:@"Content-Type" value:@"multipart/form-data"];
//    [_request addRequestHeader:@"User-Agent" value:[[AppStatus sharedInstance] ua]];
    
//    [_request setTimeOutSeconds:network_timeout];
//    [_request setNumberOfTimesToRetryOnTimeout:network_retry_count];
    NSInteger paramsCount = 0;
    if(params != nil){
        NSArray *keys = [params allKeys];
        paramsCount = [keys count];
        for (int i = 0 ; i < paramsCount; i++) {
            NSString *key = [keys objectAtIndex:i];
            if([[params objectForKey:key] class] == [UIImage class]){
                NSData *imageData = UIImagePNGRepresentation([params objectForKey:key]);
                [_request addData:imageData withFileName:[NSString stringWithFormat:@"%@.jpg", key] andContentType:@"image/jpeg" forKey:key];
            }else{
                
                if([[params objectForKey:key] isKindOfClass:[NSArray class]]){
                    NSArray *multiValues = (NSArray *)[params objectForKey:key];
                    for (NSObject *obj in multiValues) {
                        [_request addPostValue:obj forKey:key];
                    }
                }else{
                    [_request addPostValue:[params objectForKey:key] forKey:key];
                }
            }
        }
    }
    
    
    
    ASIFormDataRequest *request = _request;
    [request setCompletionBlock:^
     {
         int statusCode = [request responseStatusCode];
         NSString *responseString = [request responseString];
         if(statusCode != 200 && statusCode != 201 && statusCode != 204 && statusCode != 304){
             completionBlock(nil, nil);
         }else{
             completionBlock(responseString, nil);
         }
     }];
    
    [request setFailedBlock:^{
       
        
    }];
    [request startAsynchronous];
}

-(void)post:(NSString *)urlStr completionBlock:(void (^)(NSString *json, NSError *err))completionBlock
     jsonString:(NSString *)jsonString {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"%@", urlStr]];
    ASIFormDataRequest *_request = [ASIFormDataRequest requestWithURL:url];
    //[_request addRequestHeader:@"Content-Type" value:@"multipart/form-data"];
    
//    [_request addRequestHeader:@"User-Agent" value:[[AppStatus sharedInstance] ua]];
    
//    [_request setTimeOutSeconds:network_timeout];
//    [_request setNumberOfTimesToRetryOnTimeout:network_retry_count];
    
    
    [_request addRequestHeader:@"Content-Type" value:@"application/json"];
    
    NSMutableData *body = [NSMutableData dataWithData:[jsonString  dataUsingEncoding:NSUTF8StringEncoding]];
    [_request setPostBody:body];
    
    ASIFormDataRequest *request = _request;
    [request setCompletionBlock:^
     {
         int statusCode = [request responseStatusCode];
         NSString *responseString = [request responseString];
         if(statusCode != 200 && statusCode != 201 && statusCode != 204 && statusCode != 304){
         }else{
         }
     }];
    
    [request setFailedBlock:^{
       
        
        
    }];
    [request startAsynchronous];
}


+(HttpRequestFacade *)sharedInstance{
    static HttpRequestFacade *sharedInstance = nil;
    if(sharedInstance == nil){
        sharedInstance = [[HttpRequestFacade alloc]init];
    }
    
    return sharedInstance;
}


@end
