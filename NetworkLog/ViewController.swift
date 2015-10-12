//
//  ViewController.swift
//  NetworkLog
//
//  Created by HanedaKentarou on 2015/10/04.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var webview: UIWebView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.webview.frame = self.view.bounds
        self.view.addSubview(self.webview)
        
        let url: NSURL = NSURL(string: "http://google.com")!
        let urlRequest: NSURLRequest = NSURLRequest(URL: url)
        self.webview.loadRequest(urlRequest)    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

