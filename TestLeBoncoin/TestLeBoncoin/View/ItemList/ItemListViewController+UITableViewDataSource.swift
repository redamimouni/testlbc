//
//  ItemListViewController+UITableViewDataSource.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 13/07/2022.
//

import Foundation
import UIKit

extension ItemListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let category = categorySectionViewModel[section]
        return category.itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categorySectionViewModel[indexPath.section]
        let viewModel = category.itemList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! ItemViewCell
        cell.fill(with: viewModel, presenter: presenter)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return categorySectionViewModel.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let category = categorySectionViewModel[section]
        return category.name
    }
}
