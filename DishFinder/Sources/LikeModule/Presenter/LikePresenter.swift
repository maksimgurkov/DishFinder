import Foundation

// MARK: - LikePresenter
final class LikePresenter {
    weak var view: LikeInput?
}

// MARK: - LikePresenterProtocol
extension LikePresenter: LikePresenterProtocol {
    func viewDidLoad() {
        view?.addTitle("Избранное")
    }
}
