//
//  ItemListViewController+UITableViewDelegate.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 13/07/2022.
//

import Foundation
import UIKit

extension ItemListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.displayItemDetailView()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
