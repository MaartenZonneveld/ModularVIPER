//
//  UserOverviewModule.swift
//  VIPER
//

import ModularVIPER

enum UserOverviewCodeModule: UIKitModule {
    typealias Router = UserOverviewRouter

}

enum UserOverviewModule: UIKitStoryboardModule {
    typealias Router = UserOverviewRouter

    typealias ThisModule = UserOverviewModule

    static var storyboardName: String {
        return "UserOverview"
    }

    enum UserListComponent: ComponentProtocol {
        typealias Module = ThisModule

        typealias View = UserListViewController
        typealias Interactor = UserListInteractor
        typealias Presenter = UserListPresenter
    }

    enum UserDetailComponent: ComponentProtocol {
        typealias Module = ThisModule

        typealias View = UserListViewController
        typealias Interactor = UserListInteractor
        typealias Presenter = UserListPresenter
    }
}
