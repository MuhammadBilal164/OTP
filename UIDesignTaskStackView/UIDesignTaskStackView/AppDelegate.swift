//
//  AppDelegate.swift
//  UIDesignTaskStackView
//
//  Created by Umer Farooq on 29/09/2020.
//  Copyright © 2020 Umer Farooq. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = VerificationViewController(nibName: "VerificationViewController", bundle: nil)
        window?.makeKeyAndVisible()
        return true
        
    }
}

