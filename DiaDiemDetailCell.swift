//
//  DiaDiemDetailCell.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/29/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class DiaDiemDetailCell: UITableViewCell {

    @IBOutlet weak var lblReview: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func comment(sender: AnyObject) {
    }
    @IBAction func like(sender: AnyObject) {
    }
}