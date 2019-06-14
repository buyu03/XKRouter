//
//  XKRouter.h
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class XXRouterDefinition;

NS_ASSUME_NONNULL_BEGIN

@interface XKRouter : NSObject

+ (XXRouterDefinition *)routerDefinitionForHost:(NSString *)host;

+ (void)registerRouterDefinition:(XXRouterDefinition *)routerDefinition;

+ (void)unregisterRouterDefinitionForHost:(NSString *)host;
+ (void)unregisterAllRouterDefinitions;

+ (void)addRouteNodeForUrl:(NSString *)url handler:(UIViewController * _Nullable (^)(NSDictionary * _Nullable parameters))handlerBlock;

+ (void)removeRouteNodeForUrl:(NSString *)url;
+ (void)removeAllRouteNodesForHost:(NSString *)host;

/******************* Jump Apis *******************/

+ (BOOL)pushToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters;
+ (void)popFromViewController:(UIViewController *)viewController;

+ (BOOL)presentToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters;
+ (void)dismissFromViewController:(UIViewController *)viewController;

@end

@interface XXRouterDefinition : NSObject

@property (nonatomic, strong) NSMutableDictionary *routeNodes;
@property (nonatomic, copy) NSString *host;

- (instancetype)initWithHost:(NSString *)host;

@end

NS_ASSUME_NONNULL_END
