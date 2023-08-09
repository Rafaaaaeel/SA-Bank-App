import UIKit

final class DebitsConfigurator {
    
    static func view() -> DebitsViewController {
        let interactor = DebitsInteractor()
        let worker = DebitsWorker()
        let presenter = DebitsPresenter()
        let router = DebitsRouter()
        let viewController = DebitsViewController()
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
