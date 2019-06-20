//
//  XKProductApplyViewController.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKProductApplyViewController.h"
#import "XKRouter.h"

@interface XKProductApplyViewController ()

@end

@implementation XKProductApplyViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor purpleColor];
  
  NSLog(@"%@: productId --> %@", NSStringFromClass([self class]), self.productId);
  NSLog(@"%@: productPrice --> %@", NSStringFromClass([self class]), self.productPrice);
  NSLog(@"%@: payWay --> %@", NSStringFromClass([self class]), self.payWay);
  
  UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
  popButton.backgroundColor = [UIColor blueColor];
  [popButton setTitle:@"pop trend top" forState:UIControlStateNormal];
  [popButton addTarget:self action:@selector(popButtonClicked) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:popButton];
}

- (void)popButtonClicked {
  [XKRouter popFromViewController:self animationType:XKPopAnimationTypeTrendTop];
}

@end

