//
//  AppDelegate.swift
//  MyCoupon
//
//  Created by Eber RoEr on 2016/01/24.
//  Copyright © 2016年 Eber RoEr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Alert | .Badge | .Sound],categories: nil))  // types are UIUserNotificationType members
        
        application.registerUserNotificationSettings(
            UIUserNotificationSettings(
                forTypes: [.Alert, .Badge, .Sound],
                categories: nil))

        return true
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        
        if (application.applicationState == UIApplicationState.Active) {
            
            let alert = UIAlertView()
            alert.title = "New Coupon"
            alert.message = "Use your new coupon"
            notification.alertAction = "OK"
            alert.addButtonWithTitle(notification.alertAction!)
            alert.show()
            
        }

    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        
        if identifier == "ShowCoupon" {
            
            //launch list here
            let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewControlleripad : UIViewController = mainStoryboardIpad.instantiateViewControllerWithIdentifier("coupon") as UIViewController
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
            self.window?.rootViewController = initialViewControlleripad
            self.window?.makeKeyAndVisible()
        }
        
        completionHandler()
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

