//
//  AddNewPlace.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/2/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewPlace: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let cellAddNewPlace = "AddNewPlaceCell"
    let cellReview = "ReviewTextCell"
    let cellMap = "MapCell"
    let imageCell = "ImageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cellNib = UINib(nibName: cellAddNewPlace, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: cellAddNewPlace)
        
        var cellNib2 = UINib(nibName: cellReview, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: cellReview)
        
        var cellNib3 = UINib(nibName: cellMap, bundle: nil)
        tableView.registerNib(cellNib3, forCellReuseIdentifier: cellMap)
        
        var cellNib4 = UINib(nibName: imageCell, bundle: nil)
        tableView.registerNib(cellNib4, forCellReuseIdentifier: imageCell)
        
        self.title = "Add New Place"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellAddNewPlace, forIndexPath: indexPath) as! AddNewPlaceCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellReview, forIndexPath: indexPath) as! ReviewTextCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellMap, forIndexPath: indexPath) as! MapCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(imageCell, forIndexPath: indexPath) as! ImageCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        }else if indexPath.row == 1 {
            return 110
        }else if indexPath.row == 2 {
            return 210
        }else{
            return 171
        }
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
