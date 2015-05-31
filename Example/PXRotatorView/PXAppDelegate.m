//
//  PXAppDelegate.m
//  PXRotatorView
//
//  Created by CocoaPods on 05/26/2015.
//  Copyright (c) 2014 drinking. All rights reserved.
//

#import "PXAppDelegate.h"
#import "PXViewController.h"
#import "DKRotatorDemoViewModel.h"
#import <PXRotatorView/PXRotatorView.h>
#import <ReactiveCocoa/RACCommand.h>

@implementation PXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

//    PXViewController *pxViewController = [PXViewController new];

    
    UIViewController *vc = [UIViewController new];
    vc.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"new"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:nil action:nil];
    
    @weakify(vc)
    vc.navigationItem.rightBarButtonItem.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(vc)
        PXViewController *pxViewCtrl = [PXViewController new];
        [vc.navigationController pushViewController:pxViewCtrl animated:YES];
        [pxViewCtrl.rac_willDeallocSignal subscribeCompleted:^{
            NSLog(@"dealloc signal ...");
        }];
        [pxViewCtrl.viewModel.rac_willDeallocSignal subscribeCompleted:^{
            NSLog(@"view Model signal ...");
        }];
        return [RACSignal empty];
    }];

    UINavigationController *rootCtrl = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController =  rootCtrl;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
