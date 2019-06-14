//
//  XKProfileViewController.m
//  XKRouterDemo
//
//  Created by 徐祥 on 2019/6/14.
//  Copyright © 2019 不语. All rights reserved.
//

#import "XKProfileViewController.h"
#import "XKRouter.h"

@interface XKProfileViewController ()

@end

@implementation XKProfileViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
  NSLog(@"%@: userName --> %@", NSStringFromClass([self class]), self.userName);
  NSLog(@"%@: password --> %@", NSStringFromClass([self class]), self.password);
  NSLog(@"%@: sex --> %@", NSStringFromClass([self class]), self.sex);
  
  UIButton *dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
  dismissButton.backgroundColor = [UIColor blueColor];
  [dismissButton addTarget:self action:@selector(dismissButtonClicked) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:dismissButton];
}

- (void)dismissButtonClicked {
  [XKRouter dismissFromViewController:self];
}

@end

