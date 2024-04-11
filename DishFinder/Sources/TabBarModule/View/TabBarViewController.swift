import UIKit
import DishFinderDI

// MARK: - TabBarViewController
final class TabBarViewController: UITabBarController {

    // MARK: - Private properties
    private let presenter: TabBarPresenterProtocol

    // MARK: - Init
    init(presenter: TabBarPresenterProtocol) {
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

// MARK: - TabBarInput
extension TabBarViewController: TabBarInput { }

// MARK: - SetupView
private extension TabBarViewController {
    func setupView() {
        view.backgroundColor = .systemBackground
        tabBar.tintColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        generatorTabBar()
    }
}

// MARK: - Setting
private extension TabBarViewController {
    func generator(viewController: UIViewController, title: String, image: UIImage?) -> UINavigationController {
        let item = UITabBarItem(title: title, image: image, tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }

    func generatorTabBar() {
        @Dependency var productModule: ProductsViewController
        @Dependency var dishModule: DishViewController
        @Dependency var likeModule: LikeViewController
        @Dependency var basketModule: BasketViewController
        @Dependency var profileModule: ProfileViewController
        self.viewControllers = [
            generator(viewController: productModule, title: "Продукты", image: UIImage(systemName: "carrot")),
            generator(viewController: dishModule, title: "Рецепты", image: UIImage(systemName: "book.pages")),
            generator(viewController: likeModule, title: "Избранные", image: UIImage(systemName: "star")),
            generator(viewController: basketModule, title: "Покупки", image: UIImage(systemName: "basket")),
            generator(viewController: profileModule, title: "Профиль", image: UIImage(systemName: "person"))
        ]
    }
}
