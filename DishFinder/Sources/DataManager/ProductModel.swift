import Foundation

// MARK: - ProductModel
struct ProductModel {
    let name: String
    let calories: Int

    func toCaloriesString() -> String {
        return "В 100 граммах продукта содержится \(calories) кКал."
    }
}

struct DataManagerProducts {
    static var shared = DataManagerProducts()

    let products = [
        ProductModel(name: "Картофель", calories: 88),
        ProductModel(name: "Морковь", calories: 32),
        ProductModel(name: "Макароны", calories: 335),
        ProductModel(name: "Лук", calories: 72)
    ]
}
