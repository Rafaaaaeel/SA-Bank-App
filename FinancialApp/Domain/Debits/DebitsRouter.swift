import UIKit

final class DebitsRouter: AppRouter, DebitsRouterProtocol {
    
    func didTouchDebit(_ id: String) {
        
    }
    
    func didTouchCreate() {
        let nav = UINavigationController(rootViewController: CreatorConfigurator.view())
        nav.modalPresentationStyle = .pageSheet
        guard let sheet = nav.sheetPresentationController else { return }
        sheet.detents = [.medium()]
        currentViewController?.present(nav, animated: true)
    }

}
