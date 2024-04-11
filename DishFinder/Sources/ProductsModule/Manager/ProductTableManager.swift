import UIKit

// MARK: - ProductTableManager
final class ProductTableManager: NSObject {
    weak var tableView: UITableView?

    // MARK: - Private properties
    private var viewModels = [ProductViewModel]()
}

// MARK: - ProductTableProtocol
extension ProductTableManager: ProductTableManagerProtocol {
    func setup(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(
            ProductTableViewCell.self,
            forCellReuseIdentifier: ProductTableViewCell.description()
        )
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        self.tableView?.separatorStyle = .none
    }

    func update(viewModels: [ProductViewModel]) {
        self.viewModels = viewModels
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension ProductTableManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.description(),
            for: indexPath
        ) as? ProductTableViewCell else { return UITableViewCell() }
        cell.fill(viewModel: viewModel)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProductTableManager: UITableViewDelegate {

}
