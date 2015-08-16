//
//  AddNewPlace.swift
//  vTravel
//
//  Created by Lê Kim Tuấn on 8/2/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class AddNewPlace: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let cellAddNewPlace = "AddNewPlaceCell"
    let cellMap = "MapCell"
    let imageCell = "AddNewImageCell"
    
    let picker = UIImagePickerController()
    var img1: UIImage?
    var img2: UIImage?
    
    var flagImage = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var cellNib = UINib(nibName: cellAddNewPlace, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: cellAddNewPlace)
        
        var cellNib2 = UINib(nibName: cellMap, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: cellMap)
        
        var cellNib3 = UINib(nibName: imageCell, bundle: nil)
        tableView.registerNib(cellNib3, forCellReuseIdentifier: imageCell)
        
        self.title = "Add New Place"
        img1 = UIImage(named: "landscaping.jpeg")
        img2 = UIImage(named: "landscaping.jpeg")
        
        picker.delegate = self
        self.addFooter()
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellAddNewPlace, forIndexPath: indexPath) as! AddNewPlaceCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.txtPlaceName.delegate = self
            cell.txtPlaceName.tag = 1
            
            cell.txtTime.delegate = self
            cell.txtTime.tag = 2
            
            cell.txtDetailPlace.delegate = self
            cell.txtDetailPlace.tag = 3
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellMap, forIndexPath: indexPath) as! MapCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(imageCell, forIndexPath: indexPath) as! AddNewImageCell
            cell.vc = self
            cell.img1.image = img1
            cell.img2.image = img2
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
    }
    
    func actionSheet() {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .ActionSheet)
        
        let shootPhotoAction = UIAlertAction(title: "Shoot Photo", style: .Default, handler:
            {
                (alert: UIAlertAction!) -> Void in
                if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
                    self.picker.allowsEditing = false
                    self.picker.sourceType = UIImagePickerControllerSourceType.Camera
                    self.picker.cameraCaptureMode = .Photo
                    self.presentViewController(self.picker, animated: true, completion: nil)
                }else{
                    let alertVC = UIAlertController(title: "No Camera!", message: "Sorry, this device has no camera", preferredStyle: .Alert)
                    let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertVC.addAction(okAction)
                    self.presentViewController(alertVC, animated: true, completion: nil)
                }
        })
        
        let fromLibraryAction = UIAlertAction(title: "From Library", style: .Default, handler:
            {
                (alert: UIAlertAction!) -> Void in
                
                self.picker.allowsEditing = false
                self.picker.sourceType = .PhotoLibrary
                self.picker.modalPresentationStyle = .Popover
                self.presentViewController(self.picker, animated: true, completion: nil)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        optionMenu.addAction(shootPhotoAction)
        optionMenu.addAction(fromLibraryAction)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        if flagImage {
            img1 = chosenImage
            tableView.reloadData()
            flagImage = false
        }else{
            img2 = chosenImage
            tableView.reloadData()
            flagImage = true
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 220
        }else if indexPath.row == 1 {
            return 210
        }else{
            return 145
        }
    }
    
    func buttonSave(sender:UIButton!){
        println("Saved")
    }
    
    func buttonPost(sender:UIButton!){
        println("Posted")
    }
    
    func addFooter(){
        var footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        
        var bttSave = UIButton(frame: CGRectMake(10, 10, (tableView.frame.size.width - 50)/2, 30))
        bttSave.setTitle("Save", forState: .Normal)
        bttSave.titleLabel!.font = UIFont(name: "Times New Roman", size: 15)
        bttSave.backgroundColor = UIColor.blueColor()
        bttSave.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        bttSave.clipsToBounds = true
        bttSave.layer.cornerRadius = 10
        bttSave.addTarget(self, action: "buttonSave:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(bttSave)
        
        var bttPost = UIButton(frame: CGRectMake(CGRectGetMaxX(bttSave.frame) + 25, 10, (tableView.frame.size.width - 50)/2, 30))
        bttPost.setTitle("Post", forState: .Normal)
        bttPost.titleLabel!.font = UIFont(name: "Times New Roman", size: 15)
        bttPost.backgroundColor = UIColor.blueColor()
        bttPost.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        bttPost.clipsToBounds = true
        bttPost.layer.cornerRadius = 10
        bttPost.addTarget(self, action: "buttonPost:", forControlEvents: UIControlEvents.TouchUpInside)
        footerView.addSubview(bttPost)
        
        self.tableView.tableFooterView = footerView
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if(textField.tag == 2){
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
