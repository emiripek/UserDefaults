//
//  AppDelegate.swift
//  UserDefaults
//
//  Created by Emirhan İpek on 31.01.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: DreamDestinationsVc())
        window?.makeKeyAndVisible()

        return true
    }
}


