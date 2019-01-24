//
//  UserOverviewRouter.swift
//  VIPER
//

import UIKit

import ModularVIPER

internal enum UserOverviewRouter: UIKitRouterProtocol {
    typealias Module = UserOverviewModule

    case pushDetail

    private func buildComponentViewController() -> UIViewController {
        
        switch self {
        case .pushDetail:
            return Module.UserDetailComponent.buildView()
        }
    }

    static func entry() -> (view: UIViewController, root: UIViewController) {

        guard let navigationController = Module.storyboard().instantiateInitialViewController() as? UINavigationController else {
            fatalError()
        }
        let view = Module.UserListComponent.buildView(embedIn: navigationController)
        return (view, navigationController)
    }

    func performRoute(from: UIViewController, sender: Any? = nil) -> UIViewController {

        let destination = self.buildComponentViewController()

        switch self {
        case .pushDetail:
            from.show(destination, sender: sender)
        }

        return destination
    }
}
