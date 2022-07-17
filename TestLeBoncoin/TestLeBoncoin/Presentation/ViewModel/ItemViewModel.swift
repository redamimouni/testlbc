import Foundation
import UIKit

struct ItemViewModel: Equatable {
    static func == (lhs: ItemViewModel, rhs: ItemViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.price == rhs.price && lhs.isUrgent == rhs.isUrgent
    }

    let title: String
    let price: String
    let isUrgent: Bool
    let categoryName: String
    let imageUrl: String
}

struct CategorySectionViewModel {
    let name: String
    let itemList: [ItemViewModel]
}

extension Item {
    func toViewModel() -> ItemViewModel {
        return ItemViewModel(
            title: title,
            price: String(format: "%g €", price),
            isUrgent: isUrgent,
            categoryName: category.name,
            imageUrl: imageUrl
        )
    }
}

extension Array where Element == Item {
    func toCategorySectionViewModel() -> [CategorySectionViewModel] {
        let itemList = map({ $0.toViewModel()})
        let itemsGoupedByCategeroyName = Dictionary(grouping: itemList, by: { $0.categoryName }).map({ CategorySectionViewModel(name: $0, itemList: $1) })
        return itemsGoupedByCategeroyName
    }
}
