import UIKit

final class CardsRouter: AppRouter, CardsRouterProtocol {
    
    func didSelectCard(of id: String, at position: CGRect, model: Debit) {
        let controller = InstallmentsConfigurator.view(card: position, model: model)
        controller.modalPresentationStyle = .overFullScreen
        currentViewController?.present(controller, animated: false)
    }
    
    func didTouchCreate() {
        let nav = UINavigationController(rootViewController: CreatorConfigurator.view())
        nav.modalPresentationStyle = .pageSheet
        guard let sheet = nav.sheetPresentationController else { return }
        sheet.detents = [.medium()]
        currentViewController?.present(nav, animated: true)
    }

}
