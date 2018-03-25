//
//  AppDelegate.swift
//  TechStepApp
//
//  Created by smile on 2018/3/7.
//  Copyright © 2018年 smile. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   
    var window: UIWindow?
    
    var items: [String] = []
    var imageitems:[UIImage] = []
    let user = "ck_4656be6e0a6e14beb17cf96865d8142217bdaeac"
    let password = "cs_78dcc0128a4c966bd49bd015f4491b9727d13e3a"
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        getproducts()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func downloadImage(_ i:Int){
        
        let url = URL(string: self.items[i])
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        self.imageitems.append(UIImage(data: data!)!)
        //imageView.image = UIImage(data: data!)
    }
    
    
    
    func getproducts(){
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        var i = 0
        Alamofire.request("https://techstep.io/wp-json/wc/v2/products",
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers:headers)
            .validate()
            .responseJSON { response in
                let json = JSON(response.result.value)
                while(i<json.count){
                    let image = String(describing: json[i]["images"][0]["src"])
                    self.items.append(image)
                    self.downloadImage(i)
                    i += 1
                }
        }
        
    }

}

