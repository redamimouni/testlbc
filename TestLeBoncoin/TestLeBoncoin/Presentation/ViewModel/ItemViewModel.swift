import Foundation
import UIKit

struct ItemViewModel: Equatable {
    static func == (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.price == rhs.price
    }

    let title: String
    let price: String
    let image: UIImage
}

extension Item {
    func toViewModel() -> ItemViewModel {
        return ItemViewModel(
            title: title,
            price: String(format: "%g €", price),
            image: UIImage(data: image) ?? UIImage(named: "imageNotFound")!
        )
    }
}
