//
//  ItemCellView.swift
//  TestLeBoncoin
//
//  Created by Reda Mimouni on 15/07/2022.
//

import Foundation
import UIKit

final class ItemViewCell: UITableViewCell {
    // MARK: - Subviews

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()

    private lazy var isUrgentLabel: UILabel = {
        let label = UILabel()
        label.text = "URGENT"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 11)
        label.isHidden = true
        return label
    }()

    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .medium)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.startAnimating()
        return loader
    }()

    private lazy var leftImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()

    // MARK: - Observer

    var imageData: Data? {
        didSet {
            loader.stopAnimating()
            guard let data = imageData else {
                leftImageView.image = UIImage(named: "imageNotFound")
                return
            }
            leftImageView.image = UIImage(data: data)
        }
    }

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(leftImageView)
        leftImageView.addSubview(loader)
        contentView.addSubview(priceLabel)
        contentView.addSubview(isUrgentLabel)
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Reusable

    override func prepareForReuse() {
        super.prepareForReuse()
        resetCell()
    }

    // MARK: - Private

    private func resetCell() {
        leftImageView.image = nil
        priceLabel.text = ""
        isUrgentLabel.isHidden = true
        titleLabel.text = ""
    }

    // MARK: - Configure

    func fill(with viewModel: ItemViewModel) {
        titleLabel.text = viewModel.title
        priceLabel.text = viewModel.price
        isUrgentLabel.isHidden = !viewModel.isUrgent
    }

    // MARK: - Constraints

    private func setConstraints() {
        NSLayoutConstraint.activate([
            leftImageView.widthAnchor.constraint(equalToConstant: .imageSize),
            leftImageView.heightAnchor.constraint(equalToConstant: .imageSize),
            leftImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            leftImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),

            loader.centerXAnchor.constraint(equalTo: leftImageView.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: leftImageView.centerYAnchor),

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
