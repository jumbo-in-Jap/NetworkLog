//
//  CaptureManager.swift
//  PacketCapture
//
//  Created by HanedaKentarou on 2015/10/04.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

class CaptureManager: NSObject {
    
    //MARK: shared instance
    class var sharedInstance : CaptureManager {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : CaptureManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = CaptureManager()
        }
        return Static.instance!
    }
    
    var datas = [Capture]()
    var HISTORY_CTN = 100
    var isShow = false
    let viewController:CaptureTableViewController!
    
    // MARK: variable
    
    override init(){
        self.viewController = UIStoryboard(name: "CaptureTableViewController", bundle: nil).instantiateViewControllerWithIdentifier("capture") as? CaptureTableViewController
    }
    
    // MARK: Private
    var ignoreDomainList = [String]()
    var captures = []
    
    func isNeedCheckRequest(request:NSURLRequest)->Bool{
        for domain in self.ignoreDomainList{
            // ignoreに含まれていればこのクラスで処理しない
            if let _ = request.URL?.host!.rangeOfString(domain) {
                return false
            }
        }
        return true
    }
    
    func addCaptureData(request:NSURLRequest!, response:NSURLResponse!, success:Bool!, error:NSError!){
        let c = Capture(req: request, res: response, success:success, error:error)        
        
        if self.datas.count > 0 {
            if self.datas.count >= HISTORY_CTN{
                self.datas.removeFirst()
            }
        }
        self.datas.append(c)
    }
    
    func toggleViewController(){
        if CaptureManager.sharedInstance.isShow{
            self.viewController.dismissViewControllerAnimated(true, completion: nil)
        }else{
            UIApplication.sharedApplication().keyWindow?.rootViewController!.presentViewController(self.viewController, animated: true, completion: nil)
        }
        self.isShow = !self.isShow
    }
    

}
