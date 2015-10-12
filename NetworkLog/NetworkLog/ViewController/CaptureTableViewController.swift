//
//  CaptureTableView.swift
//  PacketCapture
//
//  Created by HanedaKentarou on 2015/09/18.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

class CaptureTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        tableView.registerNib(UINib(nibName: "CaptureTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let csrotyboard = UIStoryboard(name: "CaptureTableViewController", bundle: nil)
        let vc:CaptureDetailViewController = (csrotyboard.instantiateViewControllerWithIdentifier("detail") as? CaptureDetailViewController)!
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CaptureManager.sharedInstance.datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CaptureTableViewCell
        cell.data = CaptureManager.sharedInstance.datas[indexPath.row]
        return cell
    }
    
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath) as! CaptureTableViewCell
//        
//        cell.setNeedsLayout()
//        cell.layoutIfNeeded()
//        return cell.frame.height
//    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    deinit{
        CaptureManager.sharedInstance.isShow = false
    }
    
}
