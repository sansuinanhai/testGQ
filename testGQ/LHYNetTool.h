//
//  LHYNetTool.h
//  Net163News
//
//  Created by byit on 2016/12/29.
//  Copyright © 2016年 Kc. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface LHYNetTool : AFHTTPSessionManager

+ (instancetype)sharedNetWorkTool;

@end
