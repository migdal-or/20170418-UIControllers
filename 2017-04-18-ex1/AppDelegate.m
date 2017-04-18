//
//  AppDelegate.m
//  2017-04-18-ex1
//
//  Created by iOS-School-1 on 18.04.17.
//  Copyright © 2017 iOS-School-1. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewControllerNext.h"
#import "CustomPageVC.h"

@interface AppDelegate () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray<UIViewController *>* vcList;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    UITabBarController * tabBarController = [[UITabBarController alloc] init];
//    tabBarController.view.backgroundColor = [UIColor magentaColor];
//    tabBarController.viewControllers = @[
//                                         [ViewController new],
//                                         [ViewControllerNext new]
//                                         ];
//    self.window.rootViewController = tabBarController;
    
    CustomPageVC *pageVC = [[CustomPageVC alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                   navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                 options:@{UIPageViewControllerOptionSpineLocationKey:@(UIPageViewControllerSpineLocationMid)}];
    pageVC.dataSource = self;
    pageVC.view.frame = self.window.frame;
    UIViewController *vc1 = [ViewController new];
    vc1.view.frame = self.window.frame;
    vc1.view.backgroundColor = [UIColor yellowColor];
    UIViewController *vc2 = [ViewController new];
    vc2.view.frame = self.window.frame;
    vc2.view.backgroundColor = [UIColor brownColor];

    self.vcList = @[vc1, vc2];
    
    [pageVC setViewControllers:self.vcList
                     direction:UIPageViewControllerNavigationDirectionForward
                      animated:YES
                    completion:^(BOOL finished) {
        NSLog(@"finished");
    }];
//    pageVC.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = pageVC;
    return YES;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger currentIndex = [self.vcList indexOfObject:viewController];
    NSUInteger previousIndex = (currentIndex - 1) % self.vcList.count;
    return self.vcList[previousIndex];
}
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger currentIndex = [self.vcList indexOfObject:viewController];
    NSUInteger previousIndex = (currentIndex + 1) % self.vcList.count;
    return self.vcList[previousIndex];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
