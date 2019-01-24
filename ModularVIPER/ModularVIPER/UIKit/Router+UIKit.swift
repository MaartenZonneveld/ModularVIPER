//
//  Router+UIKit.swift
//  ModularVIPER
//

import UIKit.UIViewController

public protocol UIKitRouterProtocol: RouterProtocol where Module: UIKitStoryboardModule {

    static func entry() -> (view: UIViewController, root: UIViewController)

    func performRoute(from: UIViewController, sender: Any?) -> UIViewController
}
