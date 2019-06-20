//
//  XKProductDetailViewController.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKProductDetailViewController.h"
#import "XKRouter.h"

@interface XKProductDetailViewController ()

@end

@implementation XKProductDetailViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor yellowColor];
  
  NSLog(@"%@: productId --> %@", NSStringFromClass([self class]), self.productId);
  NSLog(@"%@: productName --> %@", NSStringFromClass([self class]), self.productName);
  
  UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
  popButton.backgroundColor = [UIColor blueColor];
  [popButton setTitle:@"pop trend fade" forState:UIControlStateNormal];
  [popButton addTarget:self action:@selector(popButtonClicked) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:popButton];
}

- (void)popButtonClicked {
  [XKRouter popFromViewController:self animationType:XKPopAnimationTypeTrendFade];
}

@end

