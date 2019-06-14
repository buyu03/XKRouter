//
//  AppDelegate.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "AppDelegate.h"
#import "XKRouterConfigure.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // 请务必在跳转之前注册所有路由节点
  [XKRouterConfigure registerRouteNodes];
  return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application { }


- (void)applicationDidEnterBackground:(UIApplication *)application { }


- (void)applicationWillEnterForeground:(UIApplication *)application { }


- (void)applicationDidBecomeActive:(UIApplication *)application { }


- (void)applicationWillTerminate:(UIApplication *)application { }


@end
