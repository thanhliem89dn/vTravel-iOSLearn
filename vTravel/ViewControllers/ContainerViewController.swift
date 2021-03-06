//
//  ContainerViewController.swift
//  vTravel
//
//  Created by SOFTLIGHT on 7/28/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController,ContainerViewDelegate {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    var currentViewController : UIViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        var vc = self.viewControllerForSegmentIndex(self.segmentControl.selectedSegmentIndex)
        self.addChildViewController(vc)
        vc.view.frame = self.containerView.bounds
        self.containerView.addSubview(vc.view)
        self.currentViewController = vc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let backBtn = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
        self.navigationItem.leftBarButtonItem = backBtn;
//        self.navigationItem.setHidesBackButton(true, animated:false);
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationItem.setHidesBackButton(false, animated:false);
    }
    
    @IBAction func segmentChanged(sender: AnyObject) {
        var vc = self.viewControllerForSegmentIndex(sender.selectedSegmentIndex)
        self.addChildViewController(vc)
        self.transitionFromViewController(self.currentViewController, toViewController: vc, duration: 0.5, options: .TransitionFlipFromBottom, animations: {
                self.currentViewController.view.removeFromSuperview()
                vc.view.frame = self.containerView.bounds
                self.containerView.addSubview(vc.view)
            }, completion:{ finished in
                vc.didMoveToParentViewController(self)
                self.currentViewController.removeFromParentViewController()
                self.currentViewController = vc
        })
    }
    func viewControllerForSegmentIndex(index : NSInteger) -> UIViewController{
        var vc : UIViewController!
        switch(index){
            case 0:
                vc = self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
                break
            case 1:
                vc = self.storyboard?.instantiateViewControllerWithIdentifier("UserViewController") as! UIViewController
                if let viewcontroller = vc as? UserViewController
                {
                    viewcontroller.delegate = self
                }
                break
            default:
                break
        }
        
        return vc
    }
    
    @IBAction func themHanhTrinh(sender: AnyObject) {
        self.performSegueWithIdentifier("goToAddNewTrip", sender: nil)
//        var vc: UIViewController
//        vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddNewTrip") as! UIViewController
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func themDiaDiem(sender: AnyObject) {
        var vc: UIViewController
        vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddNewPlace") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didPressButton(){
        var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ShowPhotoViewController") as! UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
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
