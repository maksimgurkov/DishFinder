import Foundation

// MARK: - BasketPresenter
final class BasketPresenter {
    weak var view: BasketInput?
}

// MARK: - BasketPresenterProtocol
extension BasketPresenter: BasketPresenterProtocol {
    func viewDidLoad() {
        view?.addTitle("Покупки")
    }

}
