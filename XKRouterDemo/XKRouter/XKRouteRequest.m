//
//  XKRouteRequest.m
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKRouteRequest.h"

@implementation XKRouteRequest

- (instancetype)initWithRouteUrl:(NSString *)routeUrl additionalParams:(nullable NSDictionary *)additionalParams {
  if (self = [super init]) {
    self.routeUrl = routeUrl;
    self.additionalParams = additionalParams;
    
    [self parseRouteUrl];
  }
  
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"<%@ %p> - RouteUrl: %@", NSStringFromClass([self class]), self, self.routeUrl];
}

#pragma mark - Private Methods

- (void)parseRouteUrl { // 未处理fragment
  NSURLComponents *urlComponents = [NSURLComponents componentsWithString:self.routeUrl];
  
  NSString *path = nil;
  if ([[urlComponents.path substringToIndex:1] isEqualToString:@"/"]) {
    path = [[urlComponents.path substringFromIndex:1] lowercaseString];
  } else {
    path = [urlComponents.path lowercaseString];
  }
  
  self.path = path;
  self.pathComponents = [self.path componentsSeparatedByString:@"/"];
  self.queryParams = [self parseQueryParamsWithUrlComponents:urlComponents];
}

- (NSDictionary *)parseQueryParamsWithUrlComponents:(NSURLComponents *)urlComponents {
  NSMutableDictionary *queryParams = [NSMutableDictionary dictionary];
  
  for (NSURLQueryItem *queryItem in urlComponents.queryItems) {
    if (queryItem.value == nil) {
      continue;
    }
    
    [queryParams setObject:queryItem.value forKey:queryItem.name];
  }
  
  return queryParams;
}

@end
