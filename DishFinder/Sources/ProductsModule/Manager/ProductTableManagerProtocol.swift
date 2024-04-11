import UIKit

// MARK: - ProductsTableProtocol
protocol ProductTableManagerProtocol {
    func setup(tableView: UITableView)
    func update(viewModels: [ProductViewModel])
}
