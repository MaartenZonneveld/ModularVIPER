//
//  UserListViewController.swift
//  VIPER
//

import UIKit

import ModularVIPER

internal protocol UserListViewProtocol: ViewProtocol {

    func showUserCollection(_ users: [User])
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

    private var tableViewData: [User] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.presenter.findUsers()
    }
}

extension UserListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let item = self.tableViewData[indexPath.item]

        self.presenter.viewSelectedUser(id: item.id)
    }
}

extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)

        let item = self.tableViewData[indexPath.item]

        cell.textLabel?.text = item.name

        return cell
    }
}

extension UserListViewController: UserListViewProtocol {

    func showUserCollection(_ users: [User]) {
        self.tableViewData = users
    }

    func show(error: LocalizedError) {

    }
}
