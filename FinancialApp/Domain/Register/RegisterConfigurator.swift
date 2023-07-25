class RegisterConfigurator {
    
    static func view() -> RegisterViewController {
        let interactor = RegisterInteractor()
        let worker = RegisterWoker()
        let presenter = RegisterPresenter()
        let router = RegisterRouter()
        let viewController = RegisterViewController()
        
        router.controller = viewController
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = viewController
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
    
}
