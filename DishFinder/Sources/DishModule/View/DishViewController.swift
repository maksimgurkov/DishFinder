import UIKit

// MARK: - DishViewController
final class DishViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: DishPresenterProtocol

    // MARK: - Init
    init(presenter: DishPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Override functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter.viewDidLoad()
    }

}

// MARK: - DishInput
extension DishViewController: DishInput {
    func addTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension DishViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension DishViewController {
    func addSubView() {

    }
}

// MARK: - Layout
private extension DishViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([])
    }
}
