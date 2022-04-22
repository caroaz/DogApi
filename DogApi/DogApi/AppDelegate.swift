//
//  AppDelegate.swift
//  DogApi
//
//  Created by Mobdev on 19-04-22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        let restApi = miApi()
        let viewController = ViewController()
        viewController.miApi = restApi
        let navigationController = UINavigationController(rootViewController:  viewController)
        window?.rootViewController = navigationController
        return true
    }
    
    
}

