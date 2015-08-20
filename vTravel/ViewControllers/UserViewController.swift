//
//  UserViewController.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/28/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit
@objc protocol ContainerViewDelegate{
    optional func didPressButton()
}

class UserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
  
    @IBOutlet var avatar: UIImageView!
       @IBOutlet var lblName: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    var isSwitch  = false
    let hanhtrinhCell = "HanhTrinhUserCell"
    let diadiemCell = "DiadiemUserCell"
    var delegate: ContainerViewDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.hidden = false
        var cellNib = UINib(nibName: hanhtrinhCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: hanhtrinhCell)
        var cellNib2 = UINib(nibName: diadiemCell, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: diadiemCell)
        self.navigationItem.setHidesBackButton(true, animated:true);
        tableView.showsVerticalScrollIndicator = false
        
//        self.navigationItem.setHidesBackButton(true, animated:true);
//        tableView.showsVerticalScrollIndicator = false
//        
        self.avatar.clipsToBounds = true
        self.avatar.layer.cornerRadius = 5
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        if let name = userDefault.stringForKey("name"){
            self.lblName.text = name
        }
        
        self.avatar.contentMode = UIViewContentMode.ScaleToFill
        if let data: AnyObject = userDefault.objectForKey("avatar"){
            self.avatar.image = UIImage(data: data as! NSData)
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(isSwitch){
            let ddiemCell = tableView.dequeueReusableCellWithIdentifier(diadiemCell, forIndexPath: indexPath) as! DiadiemUserCell
            var tapped1 = UITapGestureRecognizer(target: self, action: "showPhoto")
            var tapped2 = UITapGestureRecognizer(target: self, action: "showPhoto")
            var tapped3 = UITapGestureRecognizer(target: self, action: "showPhoto")
            tapped1.numberOfTapsRequired = 1
            tapped2.numberOfTapsRequired = 1
            tapped3.numberOfTapsRequired = 1
            ddiemCell.photo1.addGestureRecognizer(tapped1)
            ddiemCell.photo2.addGestureRecognizer(tapped2)
            ddiemCell.photo3.addGestureRecognizer(tapped3)
            ddiemCell.selectionStyle = UITableViewCellSelectionStyle.None;
            return ddiemCell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(hanhtrinhCell, forIndexPath: indexPath) as! HanhTrinhUserCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(isSwitch){
            return 161
        }else{
            return 111
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(isSwitch){
            var vc : DiadiemDetailViewController!
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("DiadiemDetailViewController") as! DiadiemDetailViewController
            vc.isHome = false
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            var vc : HanhTrinhDetailViewController!
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("HanhTrinhDetailViewController") as! HanhTrinhDetailViewController
            vc.isHome = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    

    @IBAction func switchTable(sender: AnyObject) {
        switch(sender.selectedSegmentIndex){
            case 0:
                isSwitch = false
                tableView.reloadData()
                break
            case 1:
                isSwitch = true
                tableView.reloadData()
                break
            default:
                break
        }
    }
    
    func showPhoto(){
        if let delegate  = self.delegate {
            delegate.didPressButton!()
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
