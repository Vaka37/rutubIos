//
//  AppDelegate.swift
//  RutubIos
//
//  Created by Kalandarov Vakil on 21.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = UINavigationController(rootViewController: ViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        
        return true
    }

}
