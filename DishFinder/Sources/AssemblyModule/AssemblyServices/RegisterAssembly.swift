import Foundation
import DishFinderDI

// MARK: - RegisterAssembly
/// RegisterAssembly - запускает регистрацию в DI
final class RegisterAssembly {
    static let shared = RegisterAssembly()
    private let assemblies: [Assembly] = [
        ProductsAssembly(),
        TabBarAssembly()
    ]

    func registerAssembly() {
        assemblies.forEach {
            $0.assemble()
        }
    }
}
