//
//  XKRouteRequest.h
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKRouteRequest : NSObject

@property (nonatomic, copy) NSString *routeUrl; // full url
@property (nonatomic, copy) NSString *path; // ignore case
@property (nonatomic, strong) NSArray *pathComponents;

@property (nonatomic, strong) NSDictionary *queryParams; // parameters in routeUrl
@property (nonatomic, strong) NSDictionary *additionalParams;

- (instancetype)initWithRouteUrl:(NSString *)routeUrl additionalParams:(nullable NSDictionary *)additionalParams;

@end

NS_ASSUME_NONNULL_END
