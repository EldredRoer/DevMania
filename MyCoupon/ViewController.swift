//
//  ViewController.swift
//  MyCoupon
//
//  Created by Eber RoEr on 2016/01/24.
//  Copyright © 2016年 Eber RoEr. All rights reserved.
//

import UIKit
import CoreLocation
import StringBuilder


class ViewController: UIViewController, CompleteTask, LocationFoundDelegate {
     let URL = "https://boiling-waters-7317.herokuapp.com/coupons"
    
     var fullRemoteUrl = ""

    @IBAction func startLocationUpdate() {
        LocationManager.sharedInstance.startLocationUpdate()
    }
    
    
    func locationFound(location:CLLocation) {
        let sb = StringBuilder()
        sb.append(URL);
        sb.append("?");
        sb.append("latitude=");
        sb.append(String(format: "%.8f",location.coordinate.latitude))
        sb.append("&");
        sb.append("longitude=");
        sb.append(String(format: "%.8f",location.coordinate.longitude))
        
        fullRemoteUrl = sb.toString()
        
        AsyncHttpTask.sharedInstance.getCouponDetails(fullRemoteUrl)
        
        
    }
    
    func taskCompleted() {
        let myNotification: UILocalNotification = UILocalNotification()
        // メッセージを代入する
        myNotification.alertTitle = "New Coupon"

        myNotification.alertBody = "Use the new coupon"
        // Timezoneを設定をする
        myNotification.timeZone = NSTimeZone.defaultTimeZone()
        myNotification.alertAction = "ShowCoupon"
        
        myNotification.applicationIconBadgeNumber = 1 // Badge number to set on the application Icon.

        // Notificationを表示する
        UIApplication.sharedApplication().scheduleLocalNotification(myNotification)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

