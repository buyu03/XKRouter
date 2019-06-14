//
//  XKRouteResponse.h
//  XXRouterDefinition
//
//  Created by 不语 on 2019/6/13.
//  Copyright © 2019 不语. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XKRouteResponse : NSObject

@property (nonatomic, strong) NSDictionary *parameters;
@property (nonatomic, assign) BOOL isMatch;

// Creates an invalid match response.
+ (instancetype)invalidMatchResponse;

// Creates a valid match response with the given parameters.
+ (instancetype)validMatchResponseWithParameters:(NSDictionary *)parameters;

@end

NS_ASSUME_NONNULL_END
