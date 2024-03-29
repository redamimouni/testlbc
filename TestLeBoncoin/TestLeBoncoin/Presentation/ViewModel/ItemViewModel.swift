import Foundation
import UIKit

struct ItemViewModel: Equatable {
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
        return itemsGoupedByCategeroyName.sorted(by: { $0.name < $1.name })
    }
}
