//
//  AddNewTrip.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/2/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewTrip: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let addNewTripCell = "AddNewTripCell"
    let reviewTextCell = "ReviewTextCell"
    let mapCell = "MapCell"
    
    var datePickerVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add New Trip"
        
        var cellNib = UINib(nibName: addNewTripCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: addNewTripCell)
        
        var cellNib2 = UINib(nibName: mapCell, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: mapCell)
        
        self.addFooter()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(addNewTripCell, forIndexPath: indexPath) as! AddNewTripCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            let userDefault = NSUserDefaults.standardUserDefaults()
            if let data: AnyObject = userDefault.objectForKey("imgAvatar"){
                cell.imgAvatar.image = UIImage(data: data as! NSData)
            }
            cell.txtNameTrip.delegate = self
            cell.txtNameTrip.tag = 1
            
            cell.txtFromDate.delegate = self
            cell.txtFromDate.tag = 2
            
            cell.txtToDate.delegate = self
            cell.txtToDate.tag = 3
            
            cell.txtDetailTrip.delegate = self
            cell.txtDetailTrip.tag = 4
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(mapCell, forIndexPath: indexPath) as! MapCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 210
        }else{
            return 211
        }
    }
    
    func addFooter(){
        var footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        var bttAdd = UIButton(frame: CGRectMake(10, 10, (tableView.frame.size.width - 50)/3, 30))
        bttAdd.setTitle("Add Place", forState: .Normal)
        bttAdd.titleLabel!.font = UIFont(name: "Times New Roman", size: 14)
        bttAdd.backgroundColor = UIColor.blueColor()
        bttAdd.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        bttAdd.clipsToBounds = true
        bttAdd.layer.cornerRadius = 10
        bttAdd.addTarget(self, action: "buttonAddPlace:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(bttAdd)
        
        var bttSave = UIButton(frame: CGRectMake(CGRectGetMaxX(bttAdd.frame) + 15, 10, (tableView.frame.size.width - 50)/3, 30))
        bttSave.setTitle("Save", forState: .Normal)
        bttSave.titleLabel!.font = UIFont(name: "Times New Roman", size: 14)
        bttSave.backgroundColor = UIColor.blueColor()
        bttSave.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        bttSave.clipsToBounds = true
        bttSave.layer.cornerRadius = 10
        bttSave.addTarget(self, action: "buttonSave:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(bttSave)
        
        var bttPost = UIButton(frame: CGRectMake(CGRectGetMaxX(bttSave.frame) + 15, 10, (tableView.frame.size.width - 50)/3, 30))
        bttPost.setTitle("Post", forState: .Normal)
        bttPost.titleLabel!.font = UIFont(name: "Times New Roman", size: 14)
        bttPost.backgroundColor = UIColor.blueColor()
        bttPost.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        bttPost.clipsToBounds = true
        bttPost.layer.cornerRadius = 10
        bttPost.addTarget(self, action: "buttonPost:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(bttPost)
        
        self.tableView.tableFooterView = footerView
    }
    
    func buttonSave(sender:UIButton!){
        println("Saved")
    }
    
    func buttonPost(sender:UIButton!){
        println("Posted")
    }
    
    func buttonAddPlace(sender:UIButton!){
        println("AddPlace")
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if((textField.tag == 2) || (textField.tag == 3)){
            textField.resignFirstResponder()
            let pickerView = UIDatePicker(frame: CGRectMake(0, 200, UIScreen.mainScreen().bounds.width, 200))
            pickerView.datePickerMode = UIDatePickerMode.Date
            pickerView.hidden = false
            pickerView.backgroundColor = UIColor.grayColor()
            pickerView.date = NSDate()
            pickerView.addTarget(self, action: "datePickerDidChangeDate:", forControlEvents: UIControlEvents.ValueChanged)
            self.view.addSubview(pickerView)
            textField.inputView = pickerView
            
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
