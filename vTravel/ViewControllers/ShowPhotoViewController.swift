//
//  ShowPhotoViewController.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/29/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class ShowPhotoViewController: UIViewController {

    @IBOutlet weak var bttClose: UIButton!
    @IBOutlet weak var photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.hidden = true
        self.navigationItem.setHidesBackButton(true, animated:true);
        bttClose.clipsToBounds = true
        bttClose.layer.cornerRadius = 8
    }

    @IBAction func close(sender: AnyObject) {
        //var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ContainerViewController") as! UIViewController
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
