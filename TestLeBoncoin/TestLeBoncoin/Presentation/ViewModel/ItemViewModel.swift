import Foundation
import UIKit

struct ItemViewModel {
    let title: String
    let price: String
    let image: UIImage
}

extension Item {
    func toViewModel() -> ItemViewModel {
        return ItemViewModel(
            title: title,
            price: String(format: "%f €", price),
            image: UIImage(data: image) ?? UIImage(named: "imageNotFound")!
        )
    }
}
