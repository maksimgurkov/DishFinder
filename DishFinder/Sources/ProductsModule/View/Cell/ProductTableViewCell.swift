import UIKit

// MARK: - ProductTableViewCell
final class ProductTableViewCell: UITableViewCell {

    // MARK: - Private properties
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let caloriesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 0.8666666667, blue: 0.1764705882, alpha: 1)
        return button
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions
    func fill(viewModel: ProductViewModel) {
        self.nameLabel.text = viewModel.name
        self.caloriesLabel.text = viewModel.colories
    }
}

// MARK: - SetupView
private extension ProductTableViewCell {
    func setupView() {
        selectionStyle = .none
        addSubView()
        setConstraints()
    }
}

// MARK: - Setting
private extension ProductTableViewCell {
    func addSubView() {
        contentView.addSubviews([nameLabel, caloriesLabel, checkButton])
    }
}

// MARK: - Layout
private extension ProductTableViewCell {
    func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),

            caloriesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            caloriesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            caloriesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            caloriesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            checkButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            checkButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            checkButton.heightAnchor.constraint(equalToConstant: 44),
            checkButton.widthAnchor.constraint(equalToConstant: 44)
        ])
    }
}
