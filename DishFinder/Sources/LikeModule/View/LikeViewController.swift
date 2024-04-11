import UIKit

// MARK: - LikeViewController
final class LikeViewController: UIViewController {

    // MARK: - Private Properties
    private let presenter: LikePresenterProtocol

    // MARK: - Init
    init(presenter: LikePresenterProtocol) {
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

// MARK: - LikeInput
extension LikeViewController: LikeInput {
    func addTitle(_ title: String) {
        self.title = title
    }
}

// MARK: - SetupView
private extension LikeViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension LikeViewController {
    func addSubView() {
        //
    }
}

// MARK: - Layout
private extension LikeViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([])
    }
}
