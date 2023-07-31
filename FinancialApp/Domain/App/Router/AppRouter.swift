import UIKit

class AppRouter {
    
    var currentViewController: UIViewController?
    
    func moveTo(_ controller: UIViewController) {
        currentViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func rootViewController(_ controller: UIViewController) {
        guard let window = UIApplication.shared.connectedScenes.flatMap({ ($0 as? UIWindowScene)?.windows ?? [] }).last else { return }
        window.rootViewController = controller
        currentViewController = controller
    }
    
}
