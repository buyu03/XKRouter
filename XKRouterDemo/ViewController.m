//
//  ViewController.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "ViewController.h"
#import "XKRouterConfigure.h"
#import "XKRouter.h"
#import "XKProductListViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (IBAction)productListButtonClicked:(id)sender { // no parameters
  [XKRouter pushToUrl:PRODUCT_LIST_PATH sourceViewController:self parameters:nil animationType:XKPushAnimationTypeFromTop];
}

- (IBAction)productDetailButtonClicked:(id)sender { // 参数来源于本地
  [XKRouter pushToUrl:PRODUCT_DETAIL_PATH sourceViewController:self parameters:@{@"productId" : @"300432", @"productName" : @"Cherry MX8.0 机械键盘（青轴）"} animationType:XKPushAnimationTypeFromFade];
}

- (IBAction)productApplyButtonClicked:(id)sender { // 参数来源于 url
  // [NSString stringWithFormat:@"%@?productId=11111&productPrice=15元&payWay=支付宝", PRODUCT_APPLY_PATH] 是为了模拟后台返回的带参url链接
  [XKRouter pushToUrl:[NSString stringWithFormat:@"%@?productId=11111&productPrice=15元&payWay=支付宝", PRODUCT_APPLY_PATH] sourceViewController:self parameters:nil animationType:XKPushAnimationTypeFromLeft];
}

- (IBAction)payButtonClicked:(id)sender { // 参数 = url + 本地
  [XKRouter pushToUrl:[NSString stringWithFormat:@"%@?productId=22222&productPrice=100刀", PRODUCT_APPLY_PATH] sourceViewController:self parameters:@{@"payWay" : @"Apply Pay"} animationType:XKPushAnimationTypeFromBottom];
}

- (IBAction)hybridSendParamButtonClicked:(id)sender { // 参数 = url + 本地
  [XKRouter presentToUrl:[NSString stringWithFormat:@"%@?userName=小明&password=123456", PROFILE_PATH] sourceViewController:self parameters:@{@"sex" : @"男"}];
}

@end

