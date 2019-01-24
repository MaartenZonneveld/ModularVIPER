//
//  Presenter+UIKit.swift
//  ModularVIPER
//

import UIKit.UIViewController

public extension PresenterProtocol where Component.Module: UIKitModule {

    func viewController() -> UIViewController? {
        return self.view as? UIViewController
    }
}
