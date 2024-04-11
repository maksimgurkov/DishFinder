import Foundation

// MARK: - ProductsPresenter
final class ProductsPresenter {
    weak var view: ProductsInput?

    // MARK: - Private properties
    private let tableManager: ProductTableManagerProtocol
    private let dataManagerProducts = DataManagerProducts.shared.products

    init(tableManager: ProductTableManagerProtocol) {
        self.tableManager = tableManager
    }
}

// MARK: - ProductsPresenterProtocol
extension ProductsPresenter: ProductsPresenterProtocol {
    func viewDidLoad() {
        view?.addTitle("Продукты")
        createViewModel(models: dataManagerProducts)
    }
}

// MARK: - Private extension
private extension ProductsPresenter {
    func createViewModel(models: [ProductModel]) {
        var viewModels = [ProductViewModel]()

        models.forEach {
            let viewmodel = ProductViewModel(name: $0.name, colories: $0.toCaloriesString())
            viewModels.append(viewmodel)
        }

        DispatchQueue.main.async {
            self.tableManager.update(viewModels: viewModels)
        }
    }
}
