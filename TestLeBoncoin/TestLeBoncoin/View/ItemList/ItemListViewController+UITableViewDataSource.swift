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
        return listItemViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = listItemViewModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! ItemViewCell
        cell.titleLabel.text = viewModel.title
        cell.priceLabel.text = viewModel.price
        cell.leftImageView.image = viewModel.image
        cell.isUrgentLabel.isHidden = !viewModel.isUrgent
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
