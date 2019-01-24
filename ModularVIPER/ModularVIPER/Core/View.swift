//
//  View.swift
//  ModularVIPER
//

public protocol ViewProtocol: class {
    associatedtype Component: ComponentProtocol

    var presenter: Component.Presenter! { get set } // strong

    static var storyboardIdentifier: String? { get }
}
