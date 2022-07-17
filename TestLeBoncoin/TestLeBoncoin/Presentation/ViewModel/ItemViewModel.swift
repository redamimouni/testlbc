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

struct CategorySectionViewModel: Equatable {
    let name: String
    let itemList: [ItemViewModel]
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

extension Array where Element == Item {
    func toCategorySectionViewModel() -> [CategorySectionViewModel] {
        let itemsGoupedByCategeroyName = Dictionary(grouping: self) { element in
            element.category.name
        }.map { categoryName, itemList in
            CategorySectionViewModel(name: categoryName, itemList: itemList.map({ $0.toViewModel() }))
        }
        return itemsGoupedByCategeroyName
    }
}
