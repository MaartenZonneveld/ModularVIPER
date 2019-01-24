//
//  UserDetailPresenter.swift
//  ModularVIPER Example
//
//  Created by Maarten Zonneveld on 24/01/2019.
//

import UIKit

import ModularVIPER

internal protocol UserDetailPresenterProtocol {

    func setup(with user: User)
}

internal class UserDetailPresenter: PresenterProtocol {
    typealias Component = UserOverviewModule.UserDetailComponent

    weak var view: UserDetailViewController?

    required init() {
        
    }
}

extension UserDetailPresenter: UserDetailPresenterProtocol {

    func setup(with user: User) {
        self.view?.showUser(user)
    }
}
