//
//  Component.swift
//  ModularVIPER
//

public protocol ComponentProtocol {
    associatedtype Module: ModuleProtocol

    associatedtype View: ViewProtocol
    associatedtype Presenter: PresenterProtocol

    static func buildView() -> View
}
