//
//  AppDelegate.swift
//  vTravel
//
//  Created by iviettech on 7/17/15.
//  Copyright (c) 2015 iviettech. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        self.startParseService(didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }

    func startParseService(didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?){
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        Parse.setApplicationId("5an0c4Tm8A8GcfQp7bYoFRLYeVqZGDFjclWdYoZF",
            clientKey: "Zcm8DJmQRFZzFaJMjoywIJvN5JJyfdMFB3Q8gQjl")
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
          //mmmmmmmmmm
        
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
        
//        var query = PFQuery(className:"GameScore")
//        query.getObjectInBackgroundWithId("VkiLrMRymo") {
//            (gameScore: PFObject?, error: NSError?) -> Void in
//            if error == nil && gameScore != nil {
//                println(gameScore)
//            } else {
//                println(error)
//            }
//        }
    }
    
    func applicationWillResignActive(application: UIApplication) {
       
    }

    func applicationDidEnterBackground(application: UIApplication) {
       
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

