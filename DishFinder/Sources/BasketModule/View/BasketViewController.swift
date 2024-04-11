import UIKit

// MARK: - BasketViewController
final class BasketViewController: UIViewController {

    // MARK: - Private properties
    private let presenter: BasketPresenterProtocol

    // MARK: - init
    init(presenter: BasketPresenterProtocol) {
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

// MARK: - BasketInput
extension BasketViewController: BasketInput {
    func addTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension BasketViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension BasketViewController {
    func addSubView() {

    }
}

// MARK: - Layout
private extension BasketViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([])
    }
}
