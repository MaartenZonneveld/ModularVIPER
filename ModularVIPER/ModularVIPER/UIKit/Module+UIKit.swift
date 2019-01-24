//
//  Module+UIKit.swift
//  ModularVIPER
//

import UIKit

public protocol UIKitModule: ModuleProtocol {
    
}

public protocol UIKitStoryboardModule: UIKitModule {

    static var storyboardName: String { get }
    static var storyboardBundle: Bundle? { get }
}

public extension UIKitStoryboardModule {

    public static var storyboardBundle: Bundle? {
        return nil
    }

    public static func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.storyboardName, bundle: self.storyboardBundle)
    }
}
