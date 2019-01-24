//
//  UserListPresenter.swift
//  VIPER
//

import Foundation

import ModularVIPER

internal protocol UserListPresenterProtocol {

    func findUsers()

    func viewSelectedUser(id: String)
}

internal class UserListPresenter: PresenterProtocol {
    typealias Component = UserOverviewModule.UserListComponent

    weak var view: Component.View?
    let interactor = Component.Interactor()

    required init() {
    }
}

extension UserListPresenter: UserListPresenterProtocol {

    func findUsers() {

        self.interactor.findAllUsers(success: { users in
            self.view?.showUserCollection(users.sortByName())
        }, failure: { error in
            self.view?.show(error: error)
        })
    }

    func viewSelectedUser(id: String) {
        if let viewController = self.viewController() {
            Component.Module.Router.userDetail.performRoute(from: viewController)
        }
    }
}

extension Array where Element == User {

    func sortByName() -> Array<Element> {
        return self.sorted { $0.name > $1.name }
    }
}
