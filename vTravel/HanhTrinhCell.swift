//
//  HanhTrinhCell.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/28/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class HanhTrinhCell: UITableViewCell {
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblReview: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTitle.numberOfLines = 0
        lblTitle.sizeToFit()
        lblReview.sizeToFit()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func like(sender: AnyObject) {
    }
    
    @IBAction func comment(sender: AnyObject) {
    }
}
