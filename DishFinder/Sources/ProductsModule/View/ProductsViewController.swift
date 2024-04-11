import UIKit

// MARK: - ProductsViewController
final class ProductsViewController: UIViewController {

    lazy var tableView: UITableView = {
        return UITableView(frame: .zero, style: .plain)
    }()

    // MARK: - Private properties
    private let presenter: ProductsPresenterProtocol

    // MARK: - Init
    init(presenter: ProductsPresenterProtocol) {
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

// MARK: - ProductsInput
extension ProductsViewController: ProductsInput {
    func addTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension ProductsViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ProductsViewController {
    func addSubView() {
        view.addSubviews([tableView])
    }
}

// MARK: - Layout
private extension ProductsViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
