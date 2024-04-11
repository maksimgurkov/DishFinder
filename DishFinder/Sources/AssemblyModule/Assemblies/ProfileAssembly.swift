import Foundation
import DishFinderDI

// MARK: - ProfileAssembly
final class ProfileAssembly: Assembly {
    func assemble() {
        Container.shared.register(service: ProfilePresenter.self) { _ in
            ProfilePresenter()
        }

        Container.shared.register(service: ProfileViewController.self) { resolve in
            let presenter: ProfilePresenter = resolve.resolve()
            return ProfileViewController(presenter: presenter)
        }

        @Dependency var presenter: ProfilePresenter
        @Dependency var view: ProfileViewController

        presenter.view = view
    }
}
