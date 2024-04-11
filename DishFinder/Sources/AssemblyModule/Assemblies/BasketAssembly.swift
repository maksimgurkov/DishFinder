import Foundation
import DishFinderDI

// MARK: - BasketAssembly
final class BasketAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: BasketPresenter.self) { _ in
            BasketPresenter()
        }

        Container.shared.register(service: BasketViewController.self) { resolve in
            let presenter: BasketPresenter = resolve.resolve()
            return BasketViewController(presenter: presenter)
        }

        @Dependency var presenter: BasketPresenter
        @Dependency var view: BasketViewController

        presenter.view = view
    }
}
