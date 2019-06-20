//
//  XKProductListViewController.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKProductListViewController.h"
#import "XKRouter.h"

@interface XKProductListViewController ()

@end

@implementation XKProductListViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor cyanColor];

  UIButton *popButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
  popButton.backgroundColor = [UIColor blueColor];
  [popButton setTitle:@"pop trend bottom" forState:UIControlStateNormal];
  [popButton addTarget:self action:@selector(popButtonClicked) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:popButton];
}

- (void)popButtonClicked {
  [XKRouter popFromViewController:self animationType:XKPopAnimationTypeTrendBottom];
}

@end

