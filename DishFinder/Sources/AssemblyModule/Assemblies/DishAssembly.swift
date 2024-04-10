import Foundation
import DishFinderDI

// MARK: - DishAssembly
final class DishAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: DishPresenter.self) { _ in
            DishPresenter()
        }

        Container.shared.register(service: DishViewController.self) { resolve in
            let presenter: DishPresenter = resolve.resolve()
            return DishViewController(presenter: presenter)
        }

        @Dependency var presenter: DishPresenter
        @Dependency var view: DishViewController

        presenter.view = view
    }
}
