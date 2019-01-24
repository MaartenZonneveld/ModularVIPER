//
//  Component+UIKit.swift
//  ModularVIPER
//

import UIKit

public extension ComponentProtocol where Module: UIKitStoryboardModule {

    public static func buildView() -> View? {

        let storyboard = Module.storyboard()
        let view: View?
        if let identifier = View.storyboardIdentifier {
            view = storyboard.instantiateViewController(withIdentifier: identifier) as? View
        } else {
            view = storyboard.instantiateInitialViewController() as? View
        }

        if let unwrappedView = view {
            guard let presenter = self.buildPresenter(view: unwrappedView) as? View.Component.Presenter else {
                fatalError()
            }
            view?.presenter = presenter
        }

        return view
    }

    private static func buildPresenter(view: View) -> Presenter {
        guard let view = view as? Presenter.Component.View else {
            fatalError()
        }
        return Presenter.init(view: view)
    }
}
