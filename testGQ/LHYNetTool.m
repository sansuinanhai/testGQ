//
//  LHYNetTool.m
//  Net163News
//
//  Created by byit on 2016/12/29.
//  Copyright © 2016年 Kc. All rights reserved.
//

#import "LHYNetTool.h"

@implementation LHYNetTool

static LHYNetTool *_netTool;

+(instancetype)sharedNetWorkTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _netTool = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com"]];
        
        _netTool.requestSerializer.timeoutInterval = 15.0f;
        
        // 2.设置非校验证书模式
        _netTool.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _netTool.securityPolicy.allowInvalidCertificates = YES;
        [_netTool.securityPolicy setValidatesDomainName:NO];

        _netTool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",nil];
    });

    return _netTool;
}


@end
