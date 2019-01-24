//
//  UserListInteractor.swift
//  VIPER
//

import Foundation

import ModularVIPER

internal final class UserListInteractor: InteractorProtocol {
    typealias Component = UserOverviewModule.UserListComponent

    func findAllUsers(success: @escaping ([User]) -> Void, failure: @escaping (LocalizedError) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            success([
                User(id: "gsd", name: "Henk"),
                User(id: "1234567890", name: "Frits"),
                User(id: "666", name: "Piet"),
                User(id: "lolololol", name: "Mohammed")
                ])
        }
    }
}
