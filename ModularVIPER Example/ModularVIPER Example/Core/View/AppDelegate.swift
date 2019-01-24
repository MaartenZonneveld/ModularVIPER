//
//  AppDelegate.swift
//  ModularVIPER Example
//

import UIKit

@UIApplicationMain
internal final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window?.rootViewController = UserOverviewModule.Router.entry().root

        return true
    }
}
