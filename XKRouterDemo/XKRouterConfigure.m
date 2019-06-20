//
//  XKRouterConfigure.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKRouterConfigure.h"
#import "XKRouter.h"
#import "XKProductListViewController.h"
#import "XKProductDetailViewController.h"
#import "XKProductApplyViewController.h"
#import "XKProfileViewController.h"

@implementation XKRouterConfigure

+ (void)registerRouteNodes {
  [XKRouter addRouteNodeForUrl:PRODUCT_LIST_PATH handler:^UIViewController * _Nullable(NSDictionary * _Nullable parameters) {
    XKProductListViewController *productViewListController = [[XKProductListViewController alloc] init];
    return productViewListController;
  }];
  
  [XKRouter addRouteNodeForUrl:PRODUCT_DETAIL_PATH handler:^UIViewController * _Nullable(NSDictionary * _Nullable parameters) {
    XKProductDetailViewController *productDetailViewController = [[XKProductDetailViewController alloc] init];
    productDetailViewController.productId = [parameters objectForKey:@"productId"];
    productDetailViewController.productName = [parameters objectForKey:@"productName"];
    
    return productDetailViewController;
  }];
  
  [XKRouter addRouteNodeForUrl:PRODUCT_APPLY_PATH handler:^UIViewController * _Nullable(NSDictionary * _Nullable parameters) {
    XKProductApplyViewController *productApplyViewController = [[XKProductApplyViewController alloc] init];
    productApplyViewController.productId = [parameters objectForKey:@"productId"];
    productApplyViewController.productPrice = [parameters objectForKey:@"productPrice"];
    productApplyViewController.payWay = [parameters objectForKey:@"payWay"];
    
    return productApplyViewController;
  }];
  
  [XKRouter addRouteNodeForUrl:PROFILE_PATH handler:^UIViewController * _Nullable(NSDictionary * _Nullable parameters) {
    XKProfileViewController *profileViewController = [[XKProfileViewController alloc] init];
    profileViewController.userName = [parameters objectForKey:@"userName"];
    profileViewController.password = [parameters objectForKey:@"password"];
    profileViewController.sex = [parameters objectForKey:@"sex"];
    
    return profileViewController;
  }];
}

@end
