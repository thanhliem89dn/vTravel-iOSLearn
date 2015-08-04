//
//  AddNewTrip.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/2/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewTrip: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let addNewTripCell = "AddNewTripCell"
    let reviewTextCell = "ReviewTextCell"
    let mapCell = "MapCell"
    let buttonCell = "AddNewTripButtonCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cellNib = UINib(nibName: addNewTripCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: addNewTripCell)
        
        var cellNib2 = UINib(nibName: reviewTextCell, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: reviewTextCell)
        
        var cellNib3 = UINib(nibName: mapCell, bundle: nil)
        tableView.registerNib(cellNib3, forCellReuseIdentifier: mapCell)
        
        var cellNib4 = UINib(nibName: buttonCell, bundle: nil)
        tableView.registerNib(cellNib4, forCellReuseIdentifier: buttonCell)
        
        self.title = "Add New Trip"
        
        //self.addFooter()

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
            let cell = tableView.dequeueReusableCellWithIdentifier(addNewTripCell, forIndexPath: indexPath) as! AddNewTripCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(reviewTextCell, forIndexPath: indexPath) as! ReviewTextCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCellWithIdentifier(mapCell, forIndexPath: indexPath) as! MapCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }else {
            let cell = tableView.dequeueReusableCellWithIdentifier(buttonCell, forIndexPath: indexPath) as! AddNewTripButtonCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 110
        }else if(indexPath.row == 1){
            return 110
        }else if indexPath.row == 2{
            return 211
        }else{
            return 70
        }
    }
    
//    func addFooter(){
//        var footerView = UIView(frame: CGRectMake(0, 0, 320, 50))
//        var btnAddPlace = UIButton(frame: CGRectMake(20 , 30, 70, 30))
//        btnAddPlace.setTitle("AddPlace", forState: .Normal)
//        btnAddPlace.backgroundColor = UIColor.blueColor()
//        btnAddPlace.titleLabel?.font = UIFont.systemFontOfSize(13)
//        btnAddPlace.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        btnAddPlace.clipsToBounds = true
//        btnAddPlace.layer.cornerRadius = 10
//        footerView.addSubview(btnAddPlace)
//        
//        var btnSave = UIButton(frame: CGRectMake(125 , 30, 70, 30))
//        btnSave.setTitle("Save", forState: .Normal)
//        btnSave.backgroundColor = UIColor.blueColor()
//        btnSave.titleLabel?.font = UIFont.systemFontOfSize(13)
//        btnSave.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        btnSave.clipsToBounds = true
//        btnSave.layer.cornerRadius = 10
//        footerView.addSubview(btnSave)
//        
//        var btnPost = UIButton(frame: CGRectMake(230 , 30, 70, 30))
//        btnPost.setTitle("Post", forState: .Normal)
//        btnPost.backgroundColor = UIColor.blueColor()
//        btnPost.titleLabel?.font = UIFont.systemFontOfSize(13)
//        btnPost.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        btnPost.clipsToBounds = true
//        btnPost.layer.cornerRadius = 10
//        footerView.addSubview(btnPost)
//        
//        self.tableView.tableFooterView = footerView
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
