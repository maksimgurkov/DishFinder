import Foundation
import DishFinderDI

// MARK: - TabBarAssembly
final class TabBarAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: TabBarPresenter.self) { _ in
            TabBarPresenter()
        }

        Container.shared.register(service: TabBarViewController.self) { resolve in
            let presenter: TabBarPresenter = resolve.resolve()
            return TabBarViewController(presenter: presenter)
        }

        @Dependency var view: TabBarViewController
        @Dependency var presenter: TabBarPresenter

        presenter.view = view
    }
}
