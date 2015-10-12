//
//  Capture.swift
//  PacketCapture
//
//  Created by HanedaKentarou on 2015/09/16.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

struct Capture {
    var requestDate:NSDate!
    var request:NSURLRequest!
    var response:NSURLResponse!
    var success:Bool!
    var error:NSError!
    var statusCode:String!
    
    init(req:NSURLRequest!, res:NSURLResponse!, success:Bool!, error:NSError!){
        self.requestDate = NSDate()
        self.request = req
        self.response = res
        self.success = success
        self.error = error
        
        if let statusCode = (response as? NSHTTPURLResponse)?.statusCode{
            self.statusCode = String(format: "%d", statusCode)
        }
        
        print("NETWORK_LOG[URL]:\(request.URL?.absoluteString)")
        print("NETWORK_LOG[RESPONSE]:\(statusCode)")

    }
}

