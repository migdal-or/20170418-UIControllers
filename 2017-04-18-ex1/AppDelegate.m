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

@interface AppDelegate ()

@property (nonatomic, strong) NSArray<UIViewController *>* vcList;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CustomPageVC *pageVC = [[CustomPageVC alloc]
                            initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                            navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                            options:@{UIPageViewControllerOptionSpineLocationKey:
                                    @(UIPageViewControllerSpineLocationMid)}];
//    pageVC.dataSource = self;
    pageVC.view.frame = self.window.frame;
    
    UIViewController *vc1 = [ViewController new];
    vc1.view.frame = self.window.frame;
    vc1.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController *vc2 = [ViewController new];
    vc2.view.frame = self.window.frame;
    vc2.view.backgroundColor = [UIColor brownColor];
    
    UIViewController *vc3 = [ViewControllerNext new];
    vc3.view.frame = self.window.frame;
    vc3.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *vc4 = [ViewControllerNext new];
    vc4.view.frame = self.window.frame;
    vc4.view.backgroundColor = [UIColor greenColor];

    self.vcList = @[vc1, vc2, vc3, vc4];
    
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

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"UIViewTests"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                     */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
