import Foundation

// MARK: - DishPresenter
final class DishPresenter {
    weak var view: DishInput?
}

// MARK: - DishPresenterProtocol
extension DishPresenter: DishPresenterProtocol {
    func viewDidLoad() {
        view?.addTitle("Рецепты")
    }
}
