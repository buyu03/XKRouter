//
//  XKRouter.h
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

/**
 XKRouter包含N条路由线路（XXRouterDefinition：类似于一个导航栈），每一条路由线路包含N个路由节点（XKRouteNode:即页面）
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XXRouterDefinition;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, XKPushAnimationType) {
  XKPushAnimationTypeDefault,     // 默认动画
  XKPushAnimationTypeNone,        // 无动画
  XKPushAnimationTypeFromLeft,    // 从左往右进入
  XKPushAnimationTypeFromBottom,  // 从下往上进入
  XKPushAnimationTypeFromTop,     // 从上往下进入
  XKPushAnimationTypeFromFade     // 淡入效果
};

typedef NS_ENUM(NSInteger, XKPopAnimationType) {
  XKPopAnimationTypeDefault,      // 默认动画
  XKPopAnimationTypeNone,         // 无动画
  XKPopAnimationTypeTrendRight,   // 向右退出
  XKPopAnimationTypeTrendTop,     // 向上退出
  XKPopAnimationTypeTrendBottom,  // 向下退出
  XKPopAnimationTypeTrendFade,    // 淡出效果
};

@interface XKRouter : NSObject

// 获取对应host的路由线路（XXRouterDefinition包含该路由线路下所有路由节点XKRouteNode）
+ (XXRouterDefinition *)routerDefinitionForHost:(NSString *)host;

// 直接注册路由线路
+ (void)registerRouterDefinition:(XXRouterDefinition *)routerDefinition;

// 移除对应host的路由线路
+ (void)unregisterRouterDefinitionForHost:(NSString *)host;
// 移除所有路由线路
+ (void)unregisterAllRouterDefinitions;

// 通过 url 注册一个路由节点（XKRouteNode）
+ (void)addRouteNodeForUrl:(NSString *)url handler:(UIViewController * _Nullable (^)(NSDictionary * _Nullable parameters))handlerBlock;

// 通过 url 移除一个路由节点
+ (void)removeRouteNodeForUrl:(NSString *)url;
// 移除 host 下所有路由节点
+ (void)removeAllRouteNodesForHost:(NSString *)host;

/******************* Jump Apis *******************/

+ (BOOL)pushToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters;
+ (void)popFromViewController:(UIViewController *)viewController;

+ (BOOL)pushToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters animationType:(XKPushAnimationType)animationType;
+ (void)popFromViewController:(UIViewController *)viewController animationType:(XKPopAnimationType)animationType;

+ (BOOL)presentToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters;
+ (void)dismissFromViewController:(UIViewController *)viewController;

@end

@interface XXRouterDefinition : NSObject

@property (nonatomic, strong) NSMutableDictionary *routeNodes;
@property (nonatomic, copy) NSString *host;

- (instancetype)initWithHost:(NSString *)host;

@end

NS_ASSUME_NONNULL_END
