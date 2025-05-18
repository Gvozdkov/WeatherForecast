//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by Алексей Гвоздков on 18.05.2025.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.rootViewController = WeatherForecastVC()
        window?.makeKeyAndVisible()
        
        return true
    }

}

