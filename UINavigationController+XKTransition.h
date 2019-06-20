//
//  UINavigationController+XKTransition.h
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/20.
//  Copyright © 2019 不语. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (XKTransition)

- (void)pushViewControllerFromLeft:(UIViewController*)viewController;
- (void)pushViewControllerFromBottom:(UIViewController*)viewController;
- (void)pushViewControllerFromTop:(UIViewController*)viewController;
- (void)pushViewControllerFromFade:(UIViewController *)viewController;

- (void)popViewControllerTrendRight;
- (void)popViewControllerTrendTop;
- (void)popViewControllerTrendBottom;
- (void)popViewControllerTrendFade;

- (void)popToViewControllerTrendRight:(UIViewController *)viewController;
- (void)popToViewControllerTrendTop:(UIViewController *)viewController;
- (void)popToViewControllerTrendBottom:(UIViewController *)viewController;
- (void)popToViewControllerTrendFade:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
