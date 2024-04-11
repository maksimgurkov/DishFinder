import UIKit

// MARK: - ProfileViewController
final class ProfileViewController: UIViewController {

    // MARK: - Private presenter
    private let presenter: ProfilePresenterProtocol

    // MARK: - Init
    init(presenter: ProfilePresenterProtocol) {
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

// MARK: - ProfileInput
extension ProfileViewController: ProfileInput {
    func addTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension ProfileViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ProfileViewController {
    func addSubView() {

    }
}

// MARK: - Layout
private extension ProfileViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([])
    }
}
