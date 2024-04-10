import Foundation
import DishFinderDI

// MARK: - LikeAssembly
final class LikeAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: LikePresenter.self) { _ in
            LikePresenter()
        }

        Container.shared.register(service: LikeViewController.self) { resolve in
            let presenter: LikePresenter = resolve.resolve()
            return LikeViewController(presenter: presenter)
        }

        @Dependency var presenter: LikePresenter
        @Dependency var view: LikeViewController

        presenter.view = view
    }
}
