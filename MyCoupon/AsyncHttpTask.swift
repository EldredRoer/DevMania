//
//  AsyncHttpTask.swift
//  MyCoupon
//
//  Created by Eber RoEr on 2016/01/24.
//  Copyright © 2016年 Eber RoEr. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol CompleteTask {
    func taskCompleted()
}
class AsyncHttpTask {
    static let sharedInstance = AsyncHttpTask()
    
    var jsonResult:JSON?
    
    var arrRes = [[String:AnyObject]]()
    
    var taskCompleteDelegate: CompleteTask?
    
    func getCouponDetails(url:String) {
        
        Alamofire.request(.GET, url).responseJSON { (responseData) -> Void in
            self.jsonResult = JSON(responseData.result.value!)
            if let resData = self.jsonResult?.arrayObject {
                self.arrRes = resData as! [[String:AnyObject]]
            }
            if self.arrRes.count > 2 {
                if let delegate = self.taskCompleteDelegate {
                    delegate.taskCompleted()
                }
            }
        }
    }
    
    func returnJSONResult() -> JSON {
        return jsonResult!
    }
}