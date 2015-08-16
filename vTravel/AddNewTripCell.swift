//
//  AddNewTripCell.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/2/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewTripCell: UITableViewCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var txtNameTrip: UITextField!
    @IBOutlet weak var txtFromDate: UITextField!
    @IBOutlet weak var txtToDate: UITextField!
    @IBOutlet weak var txtDetailTrip: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgAvatar.clipsToBounds = true
        self.imgAvatar.layer.cornerRadius = 5
        self.imgAvatar.contentMode = UIViewContentMode.ScaleToFill
        var tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.contentView.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard(){
        self.txtNameTrip.resignFirstResponder()
        self.txtDetailTrip.resignFirstResponder()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
