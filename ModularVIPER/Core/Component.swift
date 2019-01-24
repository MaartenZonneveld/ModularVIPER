//
//  Component.swift
//  ModularVIPER
//

public protocol ComponentProtocol {
    associatedtype Module: ModuleProtocol

    associatedtype View: ViewProtocol
    associatedtype Interactor: InteractorProtocol
    associatedtype Presenter: PresenterProtocol

    static func buildView() -> View?
}
