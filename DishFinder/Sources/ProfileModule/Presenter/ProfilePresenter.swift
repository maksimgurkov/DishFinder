import Foundation

// MARK: - ProfilePresenter
final class ProfilePresenter {
    weak var view: ProfileInput?
}

// MARK: - ProfilePresenterProtocol
extension ProfilePresenter: ProfilePresenterProtocol {
    func viewDidLoad() {
        view?.addTitle("Профиль")
    }
}
