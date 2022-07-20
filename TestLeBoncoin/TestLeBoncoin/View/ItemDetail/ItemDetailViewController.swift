//
//  ItemDetailViewController.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 14/07/2022.
//

import Foundation
import UIKit

class ItemDetailViewController: UIViewController, Coordinated {

    private weak var coordinator: MainCoordinator?

    // MARK: - Coordinated
    
    func bindWith(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
    }

    // MARK: - Private

    private func setupInterface() {
        view.layoutIfNeeded()
    }
}
