//
//  UserOverviewRouter.swift
//  VIPER
//

import UIKit

import ModularVIPER

internal enum UserOverviewRouter: String, UIKitRouterProtocol {
    typealias Module = UserOverviewModule

    case list
    case userDetail

    private func buildView() -> UIViewController {

        let optionalView: UIViewController?

        switch self {
        case .list:
            optionalView = Module.UserListComponent.buildView()
        case .userDetail:
            print("User Detail")
            optionalView = nil
        }

        if let view = optionalView {
            return view
        } else {
            fatalError("Could not build view")
        }
    }

    func performRoute(from: UIViewController, sender: Any? = nil) {

        let view = self.buildView()

        switch self {
        case .list:
            print("List")
        case .userDetail:
            from.showDetailViewController(view, sender: sender)
        }
    }
}
