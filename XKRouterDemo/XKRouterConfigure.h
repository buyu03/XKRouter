//
//  XKRouterConfigure.h
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const PRODUCT_LIST_PATH = @"xkrouter://buyu.com/productList";
static NSString *const PRODUCT_DETAIL_PATH = @"xkrouter://buyu.com/productList/productDetail.html";
static NSString *const PRODUCT_APPLY_PATH = @"xkrouter://buyu.com/productList/productDetail/Apply.html";
static NSString *const PROFILE_PATH = @"xkrouter://buyu.com/profile.html";

@interface XKRouterConfigure : NSObject

+ (void)registerRouteNodes;

@end

NS_ASSUME_NONNULL_END
