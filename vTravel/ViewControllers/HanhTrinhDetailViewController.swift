//
//  HanhTrinhDetailViewController.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/29/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class HanhTrinhDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let homeCell = "HanhTrinhCell"
    let userCell = "HanhTrinhUserDetailCell"
    let diadiemCell = "DiadiemUserCell"
    var isHome = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        var cellNib = UINib(nibName: homeCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: homeCell)
        var cellNib2 = UINib(nibName: diadiemCell, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: diadiemCell)
        var cellNib3 = UINib(nibName: userCell, bundle: nil)
        tableView.registerNib(cellNib3, forCellReuseIdentifier: userCell)
        self.title = "Chuyen di ABC"
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(false, animated:false);
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            if(isHome){
                let cell = tableView.dequeueReusableCellWithIdentifier(homeCell, forIndexPath: indexPath) as! HanhTrinhCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None;
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier(userCell, forIndexPath: indexPath) as! HanhTrinhUserDetailCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None;
                return cell
            }
            
        }else{
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
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            if(isHome){
                return 201
            }else{
                return 171
            }
        }else{
            return 161
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row != 0){
            var vc : DiadiemDetailViewController!
            vc = self.storyboard?.instantiateViewControllerWithIdentifier("DiadiemDetailViewController") as! DiadiemDetailViewController
            vc.isHome = isHome
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func showPhoto(){
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ShowPhotoViewController") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
