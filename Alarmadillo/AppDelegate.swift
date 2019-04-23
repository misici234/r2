//
//  AppDelegate.swift
//  Alarmadillo
//
//  Created by TwoStraws on 21/06/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import UserNotifications
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		let center = UNUserNotificationCenter.current()

		if let navController = window?.rootViewController as? UINavigationController {
			if let viewController = navController.viewControllers[0] as? ViewController {
				center.delegate = viewController
			}
		}

		let show = UNNotificationAction(identifier: "show", title: "Show Group", options: .foreground)
		let destroy = UNNotificationAction(identifier: "destroy", title: "Destroy Group", options: [.destructive, .authenticationRequired])
		let rename = UNTextInputNotificationAction(identifier: "rename", title: "Rename Group", options: [], textInputButtonTitle: "Rename", textInputPlaceholder: "Type the new name here")
        let picture = UNNotificationAction(identifier: "remove", title: "Remove Picture", options: [.destructive, .authenticationRequired])
		let category = UNNotificationCategory(identifier: "alarm", actions: [show, rename, destroy, picture], intentIdentifiers: [], options: [.customDismissAction])
        
		center.setNotificationCategories([category])

		return true
	}
}

