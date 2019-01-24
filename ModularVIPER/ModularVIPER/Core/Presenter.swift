//
//  Presenter.swift
//  ModularVIPER
//

public protocol PresenterProtocol {
    associatedtype Component: ComponentProtocol

    var view: Component.View? { get set } // weak
    var interactor: Component.Interactor { get } // strong

    init()
}

internal extension PresenterProtocol {

    init(view: Component.View) {
        self.init()
        self.view = view
    }
}
