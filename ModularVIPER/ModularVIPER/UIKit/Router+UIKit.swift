//
//  Router+UIKit.swift
//  ModularVIPER
//

import UIKit.UIViewController

public protocol UIKitRouterProtocol: RouterProtocol where Module: UIKitStoryboardModule {

    func performRoute(from: UIViewController, sender: Any?)
}
