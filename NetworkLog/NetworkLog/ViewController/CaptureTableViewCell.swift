//
//  CaptureTableViewCell.swift
//  PacketCapture
//
//  Created by HanedaKentarou on 2015/09/18.
//  Copyright © 2015年 HanedaKentarou. All rights reserved.
//

import UIKit

class CaptureTableViewCell: UITableViewCell {

    @IBOutlet weak var statusCodeLbl: UILabel!
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    var data:Capture!{
        didSet{
            statusCodeLbl.text = data.statusCode
            if statusCodeLbl.text != "200"{
                statusCodeLbl.textColor = UIColor.redColor()
            }else{
                statusCodeLbl.textColor = UIColor.blackColor()
            }
            
            urlLbl.text = data.request.URL?.absoluteString
            
            // date to string 
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
            dateFormatter.dateFormat = "HH:mm:ss"
            timeLbl.text = dateFormatter.stringFromDate(data.requestDate)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
