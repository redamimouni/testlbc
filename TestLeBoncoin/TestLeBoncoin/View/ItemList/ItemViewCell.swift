//
//  ItemCellView.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation
import UIKit

final class ItemViewCell: UITableViewCell {
    // MARK: - Default

    private let defaultImage = UIImage(named: "imageNotFound")

    // MARK: - Subviews

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()

    lazy var isUrgentLabel: UILabel = {
        let label = UILabel()
        label.text = "URGENT"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 11)
        label.isHidden = true
        return label
    }()

    lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(leftImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(isUrgentLabel)
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private

    func fill(with viewModel: ItemViewModel, presenter: ItemListPresenter) {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        isUrgentLabel.isHidden = !viewModel.isUrgent
        presenter.loadImage(with: viewModel.imageUrl) { imageData in
            DispatchQueue.main.async {
                guard let data = imageData else {
                    self.leftImageView.image = self.defaultImage
                    return
                }
                let image = UIImage(data: data)
                self.leftImageView.image = image
            }
        }
    }

    // MARK: - Constraints

    private func setConstraints() {
        NSLayoutConstraint.activate([
            leftImageView.widthAnchor.constraint(equalToConstant: .imageSize),
            leftImageView.heightAnchor.constraint(equalToConstant: .imageSize),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),

            titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: .padding),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: .paddingSmall),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.padding),

            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .paddingSmall),
            priceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.padding),

            isUrgentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.padding),
            isUrgentLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            isUrgentLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            isUrgentLabel.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor)
        ])
    }
}
