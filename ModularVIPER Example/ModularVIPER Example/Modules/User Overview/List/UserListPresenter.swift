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
    private let interactor = UserListInteractor()

    private(set) var users: [User] = [] {
        didSet {
            self.view?.showUserCollection()
        }
    }

    required init() {
        
    }
}

extension UserListPresenter: UserListPresenterProtocol {

    func findUsers() {

        self.interactor.findAllUsers(success: { users in
            self.users = users
        }, failure: { error in
            self.users = []
            self.view?.show(error: error)
        })
    }

    func viewSelectedUser(id: String) {

        guard
            let user = self.users.first(where: { $0.id == id }),
            let viewController = self.viewController() else {
                return
        }

        let destination = Component.Module.Router.pushDetail.performRoute(from: viewController) as? Component.Module.UserDetailComponent.View
        destination?.presenter.setup(with: user)
    }
}

extension Array where Element == User {

    func sortByName() -> Array<Element> {
        return self.sorted { $0.name > $1.name }
    }
}
