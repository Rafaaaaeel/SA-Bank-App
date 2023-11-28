import UIKit

final class CardsConfigurator {
    
    static func view() -> CardsViewController {
        let interactor = CardsInteractor()
        let worker = CardsWorker()
        let presenter = CardsPresenter()
        let router = CardsRouter()
        let viewController = CardsViewController()
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
