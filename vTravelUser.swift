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
}
