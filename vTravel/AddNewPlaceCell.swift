//
//  AddNewPlaceCell.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/2/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewPlaceCell: UITableViewCell {

    @IBOutlet weak var txtPlaceName: UITextField!
    @IBOutlet weak var txtTime: UITextField!
    @IBOutlet weak var txtDetailPlace: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.contentView.addGestureRecognizer(tap)
        // Initialization code
    }
    
    
    func dismissKeyboard(){
        self.txtPlaceName.resignFirstResponder()
        self.txtTime.resignFirstResponder()
        self.txtDetailPlace.resignFirstResponder()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
