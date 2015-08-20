//
//  LoginVC.swift
//  vTravel
//
//  Created by iviettech on 7/17/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,FBSDKLoginButtonDelegate {
    let permissions = ["public_profile"]
    
    
    @IBOutlet var bttLogin: FBSDKLoginButton!
 //   @IBOutlet weak var bttLogin: FBSDKLoginButton!
    var parseObject = PFObject(className: "User")
    var isLogin = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        self.navigationItem.setHidesBackButton(true, animated:true);
//        self.navigationController?.navigationBar.hidden = true
        if ((FBSDKAccessToken.currentAccessToken()) != nil) {
            isLogin = true;
            NSLog("facebook already connected");
        }
        self.pushWhenLogin()
        bttLogin.readPermissions = ["public_profile", "email", "user_friends"]
        bttLogin.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        println("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                NSLog("User logged in through Facebook!")
                var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ContainerViewController") as! UIViewController
                self.navigationController?.pushViewController(vc, animated: true)
                self.isLogin = true
                self.returnUserData()
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("User Logged Out")
        self.isLogin = false
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userID : NSString = result.valueForKey("id") as! NSString
                var facebookProfileUrl = "http://graph.facebook.com/\(userID)/picture?type=large"
                println("Avatar Url is: \(facebookProfileUrl)")
                let email : NSString = result.valueForKey("email") as! NSString
                
                let query = PFQuery(className: "User")
                query.whereKey("UserID", equalTo: userID)
                query.findObjectsInBackgroundWithBlock {
                    (objects: [AnyObject]?, error: NSError?) -> Void in
                    if let error = error {
                        // There was an error
                    } else {
                        // objects has all the Posts the current user liked.
                        if(objects!.count > 0 ){
                            NSLog("abc")
                        }else{
                            self.parseObject.setObject(userID, forKey: "UserID")
                            self.parseObject.setObject(userName, forKey: "UserName")
                            self.parseObject.setObject(facebookProfileUrl, forKey: "Avatar")
                            self.parseObject.setObject(email, forKey: "email")
                            self.parseObject.saveInBackground()
                        }
                    }
                }
                var me = vTravelUser()
                me.userID = userID
                me.userName = userName
                me.avatarURL = facebookProfileUrl
                self.saveMe(me)
            }
        })
    }
    
    func pushWhenLogin(){
        if(self.isLogin){
            var vc = self.storyboard?.instantiateViewControllerWithIdentifier("ContainerViewController") as! ContainerViewController
            self.navigationController!.pushViewController(vc, animated: true)
        }
    }
    
    func saveMe(me : vTravelUser){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(me.userID, forKey: "id")
        userDefaults.setObject(me.userName, forKey: "name")
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(queue) {
            let userDefault = NSUserDefaults.standardUserDefaults()
            if let image = me.avatarURL{
                if let url = NSURL(string: image as String) {
                    if let data = NSData(contentsOfURL: url){
                        userDefault.setObject(data, forKey: "avatar")
                        userDefaults.synchronize()
                    }
                }
            }
        }
        
        userDefaults.synchronize()
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
