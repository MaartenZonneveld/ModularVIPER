//
//  Component+UIKit.swift
//  ModularVIPER
//

import UIKit

public extension ComponentProtocol where Module: UIKitStoryboardModule {

    public static func buildView(embedIn navigationController: UINavigationController) -> View {

        let view = self.buildView()
        guard let viewController = view as? UIViewController else {
            fatalError()
        }

        navigationController.setViewControllers([viewController], animated: false)

        return view
    }

    public static func buildView() -> View {

        let storyboard = Module.storyboard()
        let view: View?
        if let identifier = View.storyboardIdentifier {
            view = storyboard.instantiateViewController(withIdentifier: identifier) as? View
        } else {
            view = storyboard.instantiateInitialViewController() as? View
        }

        guard let unwrappedView = view else {
            fatalError()
        }

        guard let presenter = self.buildPresenter(view: unwrappedView) as? View.Component.Presenter else {
            fatalError()
        }

        unwrappedView.presenter = presenter

        return unwrappedView
    }

    private static func buildPresenter(view: View) -> Presenter {
        guard let view = view as? Presenter.Component.View else {
            fatalError()
        }
        return Presenter.init(view: view)
    }
}
