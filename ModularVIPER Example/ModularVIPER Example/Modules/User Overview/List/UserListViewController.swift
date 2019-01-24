//
//  UserListViewController.swift
//  VIPER
//

import UIKit

import ModularVIPER

internal protocol UserListViewProtocol: ViewProtocol {

    func showUserCollection()
    func show(error: LocalizedError)
}

internal final class UserListViewController: UIViewController {
    typealias Component = UserOverviewModule.UserListComponent

    static var storyboardIdentifier: String? {
        return "UserListViewController"
    }

    var presenter: Component.Presenter!

    @IBOutlet
    private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "All Users"

        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.presenter.findUsers()
    }
}

extension UserListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let item = self.presenter.users[indexPath.item]

        self.presenter.viewSelectedUser(id: item.id)
    }
}

extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let item = self.presenter.users[indexPath.item]

        cell.textLabel?.text = item.name

        return cell
    }
}

extension UserListViewController: UserListViewProtocol {

    func showUserCollection() {
        self.tableView.reloadData()
    }

    func show(error: LocalizedError) {

    }
}
