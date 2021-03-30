//
//  AppDelegate.swift
//  TODO List
//
//  Created by Евангелина Клюкай on 12.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let _ = AppRoot.shared
        
        return true
    }

}

