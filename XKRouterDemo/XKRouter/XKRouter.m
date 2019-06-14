//
//  XKRouter.m
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKRouter.h"
#import "XKRouteNode.h"

@interface XKRouter ()

@property (nonatomic, strong) NSMutableDictionary *routerDefinitions;

@end

static XKRouter *_routers = nil;

@implementation XKRouter

+ (instancetype)shareInstance {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _routers = [XKRouter new];
    _routers.routerDefinitions = [NSMutableDictionary dictionary];
  });
  
  return _routers;
}

+ (XXRouterDefinition *)routerDefinitionForHost:(NSString *)host {
  return [[[XKRouter shareInstance] routerDefinitions] objectForKey:host];
}

+ (void)registerRouterDefinition:(XXRouterDefinition *)routerDefinition {
  [[[XKRouter shareInstance] routerDefinitions] setObject:routerDefinition forKey:routerDefinition.host];
}

+ (void)unregisterRouterDefinitionForHost:(NSString *)host {
  [[[XKRouter shareInstance] routerDefinitions] removeObjectForKey:[host lowercaseString]];
}

+ (void)unregisterAllRouterDefinitions {
  [[[XKRouter shareInstance] routerDefinitions] removeAllObjects];
}

+ (void)addRouteNodeForUrl:(NSString *)url handler:(UIViewController * _Nullable (^)(NSDictionary * _Nullable parameters))handlerBlock {
  url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
  XKRouteNode *routeNode = [[XKRouteNode alloc] initWithUrl:url handleBlock:handlerBlock];
  XXRouterDefinition *routerDefinition = [XKRouter routerDefinitionForHost:routeNode.host];
  
  if (!routerDefinition) {
    routerDefinition = [[XXRouterDefinition alloc] initWithHost:routeNode.host];
    [XKRouter registerRouterDefinition:routerDefinition];
  }
  
  [routerDefinition.routeNodes setObject:routeNode forKey:routeNode.path];
}

+ (void)removeRouteNodeForUrl:(NSString *)url {
  url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
  XKRouteNode *routeNode = [[XKRouteNode alloc] initWithUrl:url];
  XXRouterDefinition *routerDefinition = [XKRouter routerDefinitionForHost:routeNode.host];
  
  if (routerDefinition) {
    [routerDefinition.routeNodes removeObjectForKey:routeNode.path];
  } else {
    // print log if needed
  }
}

+ (void)removeAllRouteNodesForHost:(NSString *)host {
  XXRouterDefinition *routerDefinition = [XKRouter routerDefinitionForHost:[host lowercaseString]];
  
  if (routerDefinition) {
    [routerDefinition.routeNodes removeAllObjects];
  } else {
    // print log if needed
  }
}

+ (BOOL)pushToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters {
  url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
  NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
  if (!urlComponents) {
    NSLog(@"the url is invalid: %@", url);
    return NO;
  }
  
  UIViewController *destinationViewController = [[XKRouter shareInstance] routeToUrl:url parameters:parameters];
  if (!destinationViewController) {
    return NO;
  }
  
  [sourceViewController.navigationController pushViewController:destinationViewController animated:YES];
  return YES;
}

+ (void)popFromViewController:(UIViewController *)viewController {
  [viewController.navigationController popViewControllerAnimated:YES];
}

+ (BOOL)presentToUrl:(NSString *)url sourceViewController:(UIViewController *)sourceViewController parameters:(NSDictionary * _Nullable)parameters {
  url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
  NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
  if (!urlComponents) {
    NSLog(@"the url is invalid: %@", url);
    return NO;
  }
  
  UIViewController *destinationViewController = [[XKRouter shareInstance] routeToUrl:url parameters:parameters];
  if (!destinationViewController) {
    return NO;
  }
  
  [sourceViewController presentViewController:destinationViewController animated:YES completion:nil];
  return YES;
}

+ (void)dismissFromViewController:(UIViewController *)viewController {
  [viewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Methods

- (UIViewController *)routeToUrl:(NSString *)url parameters:(NSDictionary * _Nullable)parameters {
  XKRouteNode *urlNode = [[XKRouteNode alloc] initWithUrl:url];
  UIViewController *destinationViewController = nil;
  
  XKRouteRequest *routeRequest = [[XKRouteRequest alloc] initWithRouteUrl:url additionalParams:parameters];
  
  XXRouterDefinition *routerDefinition = [XKRouter routerDefinitionForHost:urlNode.host];
  if (!routerDefinition) {
    return destinationViewController;
  }
  
  XKRouteNode *routeNode = routerDefinition.routeNodes[urlNode.path];
  if (!routeNode) {
    return destinationViewController;
  }
  
  XKRouteResponse *routeResponse = [routeNode routeResponseForRequest:routeRequest];
  if (routeResponse.isMatch) {
    // assemble parameters: local parameters + parameters in url
    NSMutableDictionary *assembleParams = [NSMutableDictionary dictionary];
    
    if (parameters) { // assemble local parameters
      [assembleParams addEntriesFromDictionary:parameters];
    }
    
    // assemble parameters in url
    [assembleParams addEntriesFromDictionary:routeRequest.queryParams];
    
    destinationViewController = [routeNode callHandleBlockWithParameters:assembleParams];
  }
  
  return destinationViewController;
}

@end

@implementation XXRouterDefinition

- (instancetype)initWithHost:(NSString *)host {
  if (self = [super init]) {
    self.host = host;
    self.routeNodes = [NSMutableDictionary dictionary];
  }
  
  return self;
}

@end
