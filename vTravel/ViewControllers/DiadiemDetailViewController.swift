//
//  DiadiemDetailViewController.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/29/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class DiadiemDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var isHome = true
    let diadiemCell = "DiaDiemDetailCell"
    let mapCell = "MapCell"
    let imageCell = "ImageCell"
    let reviewCell = "ReviewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        var cellNib = UINib(nibName: diadiemCell, bundle: nil)
        tableView.registerNib(cellNib, forCellReuseIdentifier: diadiemCell)
        var cellNib2 = UINib(nibName: mapCell, bundle: nil)
        tableView.registerNib(cellNib2, forCellReuseIdentifier: mapCell)
        var cellNib3 = UINib(nibName: imageCell, bundle: nil)
        tableView.registerNib(cellNib3, forCellReuseIdentifier: imageCell)
        var cellNib4 = UINib(nibName: reviewCell, bundle: nil)
        tableView.registerNib(cellNib4, forCellReuseIdentifier: reviewCell)
        self.title = "Địa điểm ABC"
        if(isHome){
            self.addFooter()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            if(isHome){
                let cell = tableView.dequeueReusableCellWithIdentifier(diadiemCell, forIndexPath: indexPath) as! DiaDiemDetailCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None;
                return cell
            }else{
                let cell = tableView.dequeueReusableCellWithIdentifier(reviewCell, forIndexPath: indexPath) as! ReviewCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None;
                return cell
            }
        }else if(indexPath.row == 1){
            let cell = tableView.dequeueReusableCellWithIdentifier(mapCell, forIndexPath: indexPath) as! MapCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier(imageCell, forIndexPath: indexPath) as! ImageCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None;
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 110
        }else if(indexPath.row == 1){
            return 211
        }else{
            return 171
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.row != 0 && indexPath.row != 1){
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ShowPhotoViewController") as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func addFooter(){
        var footerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 50))
        var bttFavourite = UIButton(frame: CGRectMake(40, 10, tableView.frame.size.width - 80, 30))
        bttFavourite.setTitle("Save to my favourite", forState: .Normal)
        bttFavourite.backgroundColor = UIColor.blueColor()
        bttFavourite.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        bttFavourite.clipsToBounds = true
        bttFavourite.layer.cornerRadius = 10
        footerView.addSubview(bttFavourite)
        
        self.tableView.tableFooterView = footerView
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
