//
//  ReviewCell.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/29/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var lblReview: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblReview.numberOfLines = 0
        lblReview.sizeToFit()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
