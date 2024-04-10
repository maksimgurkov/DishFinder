import Foundation
import DishFinderDI

// MARK: - ProductsAssembly
final class ProductsAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: ProductsPresenter.self) { _ in
            ProductsPresenter()
        }

        Container.shared.register(service: ProductsViewController.self) { resolve in
            let presenter: ProductsPresenter =  resolve.resolve()
            return ProductsViewController(presenter: presenter)
        }

        @Dependency var presenter: ProductsPresenter
        @Dependency var view: ProductsViewController

        presenter.view = view
    }
}
