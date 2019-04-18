
#import "AppDelegate.h"
#import "RootViewController.h"

#import <IJKMediaFramework/IJKMediaFramework.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // rtmp://182.92.4.135:10085/hls/ch4
//    // rtmp://live.hkstv.hk.lxdns.com/live/hks
//    NSMutableArray* videoUrls = [[NSMutableArray alloc] initWithArray:@[@"rtmp://182.92.4.135:10085/hls/ch2"]];
//    NSDictionary *defaultValues = [NSDictionary dictionaryWithObjectsAndKeys: videoUrls, @"videoUrls", nil];
//
//    NSString *transport = [[NSUserDefaults standardUserDefaults] objectForKey:@"transport"];
//    if (!transport) {
//        [[NSUserDefaults standardUserDefaults] setObject:@"tcp" forKey:@"transport"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
//    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [NSThread sleepForTimeInterval:1.0];    // 设置启动页面时间
    [[UINavigationBar appearance] setBarTintColor:MAIN_COLOR];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[RootViewController alloc] init]];
    [nav.navigationItem.backBarButtonItem setTintColor:[UIColor whiteColor]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    // key有效时间
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    NSURL *url = [NSURL URLWithString:@""];
    IJKFFMoviePlayerController *player = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:options key:@"6468647364762B32734B7941725370636F395652792F4A4659584E35554778686557567955484A76567778576F50394C2F69426C59584E35"];
    int activeDays = [player activeDays];
    NSLog(@"有效天数：%d", activeDays);
    
    [[NSUserDefaults standardUserDefaults] setInteger:activeDays forKey:@"activeDays"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end