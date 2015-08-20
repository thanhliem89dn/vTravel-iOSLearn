//
//  vTravelUser.swift
//  vTravel
//
//  Created by iviettech on 8/17/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit

class vTravelUser: NSObject {
    var userID : NSString?
    var userName : NSString?
    var avatarURL : NSString?
    
    override init() {
        
    }
    
    convenience init(_ dictionary : Dictionary<String,AnyObject>){
        self.init()
        
        userID = dictionary["id"] as? NSString
        userName = dictionary["name"] as? NSString
        avatarURL = dictionary["avatar"] as? NSString
    }
    
    func convertToParserObject() -> PFObject {
        var travelUser = PFObject(className:"vTravelUser")
        travelUser["userID"] = self.userID
        travelUser["userName"] = self.userName
        travelUser["avatarURL"] = self.avatarURL
        //them thuoc tinh
        return travelUser
    }
    
    func saveToParser(){
        var parserObject = self.convertToParserObject()
        parserObject.saveInBackground()
    }
    

    
    //        var gameScore = PFObject(className:"GameScore")
    //        gameScore["score"] = 1337
    //        gameScore["playerName"] = "Sean Plott"
    //        gameScore["cheatMode"] = false
    //        gameScore.saveInBackgroundWithBlock {
    //            (success: Bool, error: NSError?) -> Void in
    //            if (success) {
    //                // The object has been saved.
    //            } else {
    //                // There was a problem, check error.description
    //            }
    //        }

}
