//
//  DiadiemUserCell.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/28/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class DiadiemUserCell: UITableViewCell {

    @IBOutlet weak var diadiemName: UILabel!
    @IBOutlet weak var lblReview: UILabel!
    @IBOutlet weak var photo1: UIImageView!
    @IBOutlet weak var photo2: UIImageView!
    @IBOutlet weak var photo3: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        photo1.userInteractionEnabled = true
        photo2.userInteractionEnabled = true
        photo3.userInteractionEnabled = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
