import Foundation
import DishFinderDI

// MARK: - ProductsAssembly
final class ProductsAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: ProductTableManager.self) { _ in
            ProductTableManager()
        }

        Container.shared.register(service: ProductsPresenter.self) { resolve in
            let tableManager: ProductTableManager = resolve.resolve()
            return ProductsPresenter(tableManager: tableManager)
        }

        Container.shared.register(service: ProductsViewController.self) { resolve in
            let presenter: ProductsPresenter =  resolve.resolve()
            return ProductsViewController(presenter: presenter)
        }

        @Dependency var presenter: ProductsPresenter
        @Dependency var view: ProductsViewController
        @Dependency var tableManager: ProductTableManager

        presenter.view = view
        tableManager.setup(tableView: view.tableView)
    }
}
