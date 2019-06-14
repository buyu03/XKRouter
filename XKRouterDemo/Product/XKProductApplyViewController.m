//
//  XKProductApplyViewController.m
//  XKRouterDemo
//
//  Created by 徐祥 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKProductApplyViewController.h"

@interface XKProductApplyViewController ()

@end

@implementation XKProductApplyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor purpleColor];
  
  NSLog(@"%@: productId --> %@", NSStringFromClass([self class]), self.productId);
  NSLog(@"%@: productPrice --> %@", NSStringFromClass([self class]), self.productPrice);
  NSLog(@"%@: payWay --> %@", NSStringFromClass([self class]), self.payWay);
}

@end

