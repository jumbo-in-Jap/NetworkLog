//
//  CaptureDetailViewController.swift
//  NetworkLog
//
//  Created by HanedaKentarou on 2015/10/12.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

enum Section:Int {
    case Request
    case Response
}

enum RequestCell:Int{
    case Date
    case Url
}

enum ResponseCell:Int{
    case StatusCode
    case Data
}

class CaptureDetailViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableViewAutomaticDimension

        let button = UIButton(frame: CGRectMake(self.view.frame.size.width - 60, self.view.frame.size.height - 60, 50, 50));
        button.setBackgroundImage(UIImage(named: "closeBtn")!, forState: UIControlState.Normal)
        button.addTarget(self, action: "close:", forControlEvents:.TouchUpInside);
        self.view.addSubview(button);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func close(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if(indexPath.section == Section.Request.rawValue){
            if indexPath.row == RequestCell.Date.rawValue{
                
            }else if indexPath.row == RequestCell.Url.rawValue{
            
            }
        }else if(indexPath.section == Section.Response.rawValue){
            if indexPath.row == ResponseCell.StatusCode.rawValue{
                
            }else if indexPath.row == ResponseCell.Data.rawValue{
                
            }
        }
        
        return cell
    }

}
