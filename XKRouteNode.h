//
//  XKRouteNode.h
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XKRouteResponse.h"
#import "XKRouteRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef UIViewController *_Nullable(^RouteHandleBlock)(NSDictionary * _Nullable parameters);

@interface XKRouteNode : NSObject

@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) NSString *host;
@property (nonatomic, strong) NSArray *pathComponents;
@property (nonatomic, copy) RouteHandleBlock handleBlock;

- (instancetype)initWithUrl:(NSString *)url;
- (instancetype)initWithUrl:(NSString *)url handleBlock:(UIViewController * _Nullable (^)(NSDictionary * _Nullable parameters))handleBlock;

- (XKRouteResponse *)routeResponseForRequest:(XKRouteRequest *)request;
- (UIViewController *)callHandleBlockWithParameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
