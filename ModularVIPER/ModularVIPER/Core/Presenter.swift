//
//  Presenter.swift
//  ModularVIPER
//

public protocol PresenterProtocol {
    associatedtype Component: ComponentProtocol

    var view: Component.View? { get set } // weak

    init()
}

internal extension PresenterProtocol {

    init(view: Component.View) {
        self.init()
        self.view = view
    }
}
