import Foundation

// MARK: - ProductsPresenter
final class ProductsPresenter {
    weak var view: ProductsInput?
}

// MARK: - ProductsPresenterProtocol
extension ProductsPresenter: ProductsPresenterProtocol {
    func viewDidLoad() {
        view?.addTitle("Продукты")
    }
}
