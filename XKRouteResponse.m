//
//  XKRouteResponse.m
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKRouteResponse.h"

@implementation XKRouteResponse

+ (instancetype)invalidMatchResponse {
  XKRouteResponse *routeResponse = [[XKRouteResponse alloc] init];
  routeResponse.isMatch = NO;
  
  return routeResponse;
}

+ (instancetype)validMatchResponseWithParameters:(NSDictionary *)parameters {
  XKRouteResponse *routeResponse = [[XKRouteResponse alloc] init];
  routeResponse.isMatch = YES;
  routeResponse.parameters = parameters;
  
  return routeResponse;
}

#pragma mark - Override Methods

- (BOOL)isEqual:(id)object {
  if (object == self) {
    return YES;
  }
  
  if ([object isKindOfClass:[self class]]) {
    return [self isEqualToRouteResponse:(XKRouteResponse *)object];
  } else {
    return [super isEqual:object];
  }
}

- (BOOL)isEqualToRouteResponse:(XKRouteResponse *)response {
  if (self.isMatch != response.isMatch) {
    return NO;
  }
  
  if (!((self.parameters == nil && response.parameters == nil) || [self.parameters isEqualToDictionary:response.parameters])) {
    return NO;
  }
  
  return YES;
}

- (NSUInteger)hash {
  return @(self.isMatch).hash ^ self.parameters.hash;
}

- (id)copyWithZone:(NSZone *)zone {
  XKRouteResponse *copy = [[[self class] alloc] init];
  copy.isMatch = self.isMatch;
  copy.parameters = self.parameters;
  
  return copy;
}

@end
