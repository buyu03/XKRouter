//
//  XKProductDetailViewController.m
//  XKRouterDemo
//
//  Created by 徐祥 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKProductDetailViewController.h"

@interface XKProductDetailViewController ()

@end

@implementation XKProductDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor yellowColor];
  
  NSLog(@"%@: productId --> %@", NSStringFromClass([self class]), self.productId);
  NSLog(@"%@: productName --> %@", NSStringFromClass([self class]), self.productName);
}

@end

