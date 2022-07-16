import Foundation
import UIKit

struct ItemViewModel: Equatable {
    static func == (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.price == rhs.price && lhs.isUrgent == rhs.isUrgent
    }

    let title: String
    let price: String
    let isUrgent: Bool
    let imageUrl: String
}

extension Item {
    func toViewModel() -> ItemViewModel {
        return ItemViewModel(
            title: title,
            price: String(format: "%g €", price),
            isUrgent: isUrgent,
            imageUrl: imageUrl
        )
    }
}
