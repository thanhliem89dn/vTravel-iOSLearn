//
//  UserViewController.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/28/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var segment: UISegmentedControl!
    var isSwitch  = false
    let hanhtrinhCell = "HanhTrinhUserCell"
    let diadiemCell = "DiadiemUserCell"
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
            ddiemCell.selectionStyle = UITableViewCellSelectionStyle.None;
            return ddiemCell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(hanhtrinhCell, forIndexPath: indexPath) as! HanhTrinhUserCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 111
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
