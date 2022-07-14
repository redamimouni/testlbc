//
//  ItemListViewController.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 13/07/2022.
//

import UIKit

final class ItemListViewController: UIViewController, ItemListDelegate, Coordinated {
    // MARK: - Data

    internal var listItemViewModel: [ItemViewModel] = []

    // MARK: - Dependencies

    private let presenter = ItemListPresenter()
    internal weak var coordinator: MainCoordinator?

    // MARK: - Subviews

    private lazy var tableView: UITableView = createTableView()

    // MARK: - Coordinated

    func bindWith(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        presenter.delegate = self
        presenter.fetchItemList()
    }

    // MARK: - Delegate

    func displayItemList(items: [ItemViewModel]) {
        listItemViewModel = items
        tableView.reloadData()
    }

    // MARK: - Private

    private func setupInterface() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        view.layoutIfNeeded()
    }

    private func createTableView() -> UITableView {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInset = .zero
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionFooterHeight = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }
}
