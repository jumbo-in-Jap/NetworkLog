//
//  CaptureProtocol.swift
//  PacketCapture
//
//  Created by HanedaKentarou on 2015/09/16.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

class CaptureProtocol: NSURLProtocol ,NSURLSessionDelegate, NSURLSessionDataDelegate{
    
    
    override class func canInitWithRequest(request: NSURLRequest) -> Bool {
        return CaptureManager.sharedInstance.isNeedCheckRequest(request)
    }
    
    override class func canonicalRequestForRequest (request: NSURLRequest) -> NSURLRequest {
        return request;
    }
    
    override func startLoading() {
        
        let session:NSURLSession = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration(), delegate: self, delegateQueue: nil)

        session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            CaptureManager.sharedInstance.addCaptureData(self.request, response: response, success: error == nil, error: error)
            
            if error != nil{
                self.client?.URLProtocol(self, didFailWithError: error!)
                return
            }
            
            self.client?.URLProtocol(self, didReceiveResponse: response!, cacheStoragePolicy: NSURLCacheStoragePolicy.Allowed)
            self.client?.URLProtocol(self, didLoadData: data!)
            self.client?.URLProtocolDidFinishLoading(self)
        }.resume()
    }
    
    override func stopLoading() {}
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, willPerformHTTPRedirection response: NSHTTPURLResponse, newRequest request: NSURLRequest, completionHandler: (NSURLRequest?) -> Void) {
        
        self.client?.URLProtocol(self, wasRedirectedToRequest: request, redirectResponse: response)
        
    }
    
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.client?.URLProtocol(self, didLoadData: data)
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        self.client?.URLProtocol(self, didReceiveResponse: response, cacheStoragePolicy: NSURLCacheStoragePolicy.Allowed)
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil{
            self.client?.URLProtocol(self, didFailWithError: error!)
        }else{
            self.client?.URLProtocolDidFinishLoading(self)
        }
    }
}
