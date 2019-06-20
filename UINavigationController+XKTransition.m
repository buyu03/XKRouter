//
//  UINavigationController+XKTransition.m
//  XKRouterDemo
//
//  Created by 不语 on 2019/6/20.
//  Copyright © 2019 不语. All rights reserved.
//

#import "UINavigationController+XKTransition.h"

@implementation UINavigationController (XKTransition)

- (void)pushViewControllerFromLeft:(UIViewController*)viewController {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionReveal;
  transition.subtype = kCATransitionFromLeft;
  [self.view.layer addAnimation:transition forKey:kCATransition];
  
  [self pushViewController:viewController animated:NO];
}

- (void)pushViewControllerFromBottom:(UIViewController*)viewController {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionMoveIn;
  transition.subtype = kCATransitionFromTop;
  [self.view.layer addAnimation:transition forKey:kCATransition];
  
  [self pushViewController:viewController animated:NO];
}

- (void)pushViewControllerFromTop:(UIViewController*)viewController {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionPush;
  transition.subtype = kCATransitionFromBottom;
  [self.view.layer addAnimation:transition forKey:kCATransition];
  
  [self pushViewController:viewController animated:NO];
}

- (void)pushViewControllerFromFade:(UIViewController *)viewController {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionFade;
  [self.view.layer addAnimation:transition forKey:nil];
  [self pushViewController:viewController animated:NO];
}

- (void)popViewControllerTrendRight {
  CATransition *transtion = [CATransition animation];
  transtion.duration = 0.25;
  transtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transtion.type = kCATransitionReveal;
  transtion.subtype = kCATransitionFromLeft;
  [self.view.layer addAnimation:transtion forKey:kCATransition];
  
  [self popViewControllerAnimated:NO];
}

- (void)popViewControllerTrendTop {
  CATransition *transtion = [CATransition animation];
  transtion.duration = 0.25;
  transtion.type = kCATransitionReveal;
  transtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transtion.subtype = kCATransitionFromTop;
  [self.view.layer addAnimation:transtion forKey:kCATransition];
  
  [self popViewControllerAnimated:NO];
}

- (void)popViewControllerTrendBottom {
  CATransition *transtion = [CATransition animation];
  transtion.duration = 0.25;
  transtion.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transtion.type = kCATransitionReveal;
  transtion.subtype = kCATransitionFromBottom;
  [self.view.layer addAnimation:transtion forKey:kCATransition];
  
  [self popViewControllerAnimated:NO];
}

- (void)popViewControllerTrendFade {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionFade;
  [self.view.layer addAnimation:transition forKey:nil];
  
  [self popViewControllerAnimated:NO];
}

- (void)popToViewControllerTrendRight:(UIViewController *)viewController {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionReveal;
  transition.subtype = kCATransitionFromRight;
  [self.view.layer addAnimation:transition forKey:kCATransition];
  
  [self popToViewController:viewController animated:NO];
}

- (void)popToViewControllerTrendTop:(UIViewController *)viewController  {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionReveal;
  transition.subtype = kCATransitionFromTop;
  [self.view.layer addAnimation:transition forKey:kCATransition];
  
  [self popToViewController:viewController animated:NO];
}

- (void)popToViewControllerTrendBottom:(UIViewController *)viewController  {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionReveal;
  transition.subtype = kCATransitionFromBottom;
  [self.view.layer addAnimation:transition forKey:kCATransition];
  
  [self popToViewController:viewController animated:NO];
}

- (void)popToViewControllerTrendFade:(UIViewController *)viewController {
  CATransition *transition = [CATransition animation];
  transition.duration = 0.25;
  transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  transition.type = kCATransitionFade;
  [self.view.layer addAnimation:transition forKey:nil];
  
  [self popToViewController:viewController animated:NO];
}

@end
