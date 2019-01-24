//
//  UserDetailViewController.swift
//  ModularVIPER Example
//
//  Created by Maarten Zonneveld on 24/01/2019.
//

import UIKit

import ModularVIPER

internal protocol UserDetailViewProtocol: ViewProtocol {

    func showUser(_ user: User)
}

internal final class UserDetailViewController: UIViewController, UserDetailViewProtocol {

    typealias Component = UserOverviewModule.UserDetailComponent

    static var storyboardIdentifier: String? {
        return "UserDetailViewController"
    }

    var presenter: Component.Presenter!

    @IBOutlet
    private weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameLabel.text = nil
    }

    func showUser(_ user: User) {
        self.view.setNeedsLayout() // force lazy load view
        self.nameLabel.text = user.name
    }
}
