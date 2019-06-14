//
//  XKRouteNode.m
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKRouteNode.h"

@implementation XKRouteNode

#pragma mark - Create

- (instancetype)initWithUrl:(NSString *)url {
  if (self = [super init]) {
    [self checkUrl:url];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
    [self parsePathWithURLComponents:urlComponents];
    [self parseHostWithURLComponents:urlComponents];
    [self parsePathComponents];
  }
  
  return self;
}

- (instancetype)initWithUrl:(NSString *)url handleBlock:(UIViewController * _Nullable (^)(NSDictionary * _Nullable parameters))handleBlock {
  if (self = [super init]) {
    [self checkUrl:url];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
    [self parsePathWithURLComponents:urlComponents];
    [self parseHostWithURLComponents:urlComponents];
    [self parsePathComponents];
    
    self.handleBlock = handleBlock;
  }
  
  return self;
}

#pragma mark - Public Methods

- (XKRouteResponse *)routeResponseForRequest:(XKRouteRequest *)request {
  XKRouteResponse *routeResponse = nil;
  
  if (self.pathComponents == nil || self.pathComponents.count == 0) {
    routeResponse = [XKRouteResponse invalidMatchResponse];
    
  }else if (self.pathComponents.count != request.pathComponents.count) {
    routeResponse = [XKRouteResponse invalidMatchResponse];
    
  } else {
    routeResponse = [XKRouteResponse validMatchResponseWithParameters:request.additionalParams];
    
    for (int i = 0; i < self.pathComponents.count; i++) {
      if ([self.pathComponents[i] isEqualToString:request.pathComponents[i]]) {
        continue;
      } else {
        routeResponse = [XKRouteResponse invalidMatchResponse];
      }
    }
  }
  
  return routeResponse;
}

- (UIViewController *)callHandleBlockWithParameters:(NSDictionary *)parameters {
  return self.handleBlock ? self.handleBlock(parameters) : nil;
}

#pragma mark - Private Methods

- (void)checkUrl:(NSString *)url {
  NSURLComponents *urlComponents = [NSURLComponents componentsWithString:url];
  
  if (urlComponents == nil || url.length == 0) {
    NSString *desc = [NSString stringWithFormat:@"url is not valid: %@", url];
    NSAssert(YES, desc);
  }
}

- (void)parsePathWithURLComponents:(NSURLComponents *)urlComponents {
  NSString *path = nil;
  if ([[urlComponents.path substringToIndex:1] isEqualToString:@"/"]) {
    path = [[urlComponents.path substringFromIndex:1] lowercaseString];
  } else {
    path = [urlComponents.path lowercaseString];
  }
  
  self.path = path;
}

- (void)parseHostWithURLComponents:(NSURLComponents *)urlComponents {
  self.host = [urlComponents.host lowercaseString];
}

- (void)parsePathComponents {
  self.pathComponents = [self.path componentsSeparatedByString:@"/"];
}

@end
