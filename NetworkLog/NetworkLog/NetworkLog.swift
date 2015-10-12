//
//  NetworkLog.swift
//  NetworkLog
//
//  Created by HanedaKentarou on 2015/10/04.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

class NetworkLog: NSObject {
    
    class func on(){
        // Only Set debug
        #if DEBUG
            NSURLProtocol.registerClass(CaptureProtocol)
            self.setShowBtn()
        #endif
    }
    
    class func off(){
        NSURLProtocol.unregisterClass(CaptureProtocol)
    }
    
    class func setShowBtn(){
        let button = UIButton(frame: CGRectMake(10, 0, 100, 50));
        button.backgroundColor = UIColor.grayColor();
        button.addTarget(self, action: "toggle:", forControlEvents:.TouchUpInside);
        button.setTitle("↓", forState: UIControlState.Normal);
        
        UIApplication.sharedApplication().delegate?.window??.addSubview(button)
    }
    
    class func toggle(sender: UIButton){
        CaptureManager.sharedInstance.toggleViewController()
    }
    
}
