//
//  EGGAppDelegate.m
//  Baccus2
//
//  Created by Eduardo on 03/06/14.
//  Copyright (c) 2014 Lotengo. All rights reserved.
//

#import "EGGAppDelegate.h"
#import "EGGWineModel.h"
#import "EGGWineViewController.h"
#import "EGGWebViewController.h"
#import "EGGWineryModel.h"
#import "EGGWineryTableViewController.h"

@implementation EGGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Creamos el modelo
    EGGWineryModel *winery = [[EGGWineryModel alloc] init];
    
    //Creamos los controladores
    EGGWineryTableViewController *wineryVC = [[EGGWineryTableViewController alloc] initWithModel:winery
                                                                                           style:UITableViewStylePlain];
    
    //Asginamos el ultimo vino seleccionado en la sesion anterior
    EGGWineViewController *wineVC = [[EGGWineViewController alloc]initWithModel:[wineryVC lastSelectedWine]];
    
    //Creamos los navigation
    UINavigationController *wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    UINavigationController *wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    /*
     UINavigationController *tintoNav = [[UINavigationController alloc] initWithRootViewController:tintoVC];
    UINavigationController *blancoNav = [[UINavigationController alloc] initWithRootViewController:blancoVC];
    UINavigationController *otroNav = [[UINavigationController alloc] initWithRootViewController:otroVC];
    
    //Creamos un combinandor Navigation- tabBar
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    tabVC.viewControllers = @[tintoNav, blancoNav, otroNav];
     */
    
    //Creamos un combinador SplitView
    UISplitViewController *splitVC = [[UISplitViewController alloc] init];
    splitVC.viewControllers = @[wineryNav, wineNav];
    
    //Asignamos delegados
    splitVC.delegate = wineVC;
    wineryVC.delegate = wineVC;
    
    //Asignamos este controlador como el controlador raiz, el primero en aparecer
    self.window.rootViewController = splitVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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
