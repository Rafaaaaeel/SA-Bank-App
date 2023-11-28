import UIKit

final class InstallmentsConfigurator {
    
    static func view(card position: CGRect, model: Debit) -> InstallmentsViewController {
        let interactor = InstallmentsInteractor()
        let worker = InstallmentsWorker()
        let presenter = InstallmentsPresenter()
        let router = InstallmentsRouter()
        let viewController = InstallmentsViewController(card: position, model: model)
        router.currentViewController = viewController
        interactor.presenter = presenter
        interactor.worker = worker
        worker.output = interactor
        presenter.view = viewController
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
    
}
