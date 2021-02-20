//
//  AppDelegate.swift
//  testGQ
//
//  Created by Black on 2021/2/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let VC = ViewController()
        let nav = UINavigationController(rootViewController: VC)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

}

