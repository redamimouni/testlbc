//
//  Coordinator.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import UIKit

protocol Coordinated where Self: UIViewController {
    func bindWith(coordinator: MainCoordinator)
}

protocol Coordinator {
    var navigationController: UINavigationController { get set }

    func displayItemListView()
    func displayItemDetailView()
}

final class MainCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func displayItemListView() {
        let repository = ItemRepositoryImpl()
        let presenter = ItemListPresenter(useCase: FetchItemListUseCaseImpl(repository: repository))
        let viewController = ItemListViewController(presenter: presenter)
        viewController.bindWith(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }

    func displayItemDetailView() {
        let viewController = ItemDetailViewController()
        viewController.bindWith(coordinator: self)
        navigationController.pushViewController(viewController, animated: false)
    }
}
