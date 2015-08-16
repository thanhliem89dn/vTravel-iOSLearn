//
//  AddNewImageCell.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/11/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewImageCell: UITableViewCell {

    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    var vc: AddNewPlace?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addImage(sender: AnyObject) {
        vc?.actionSheet()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
