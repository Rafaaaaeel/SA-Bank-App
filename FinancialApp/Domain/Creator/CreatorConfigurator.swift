final class CreatorConfigurator {
    
    static func view() -> CreatorViewController {
        let interactor = CreatorInterector()
        let worker = CreatorWorker()
        let presenter = CreatorPresenter()
        let router = CreatorRouter()
        let viewController = CreatorViewController()
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
