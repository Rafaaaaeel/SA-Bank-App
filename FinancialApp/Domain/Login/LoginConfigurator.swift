class LoginConfigurator {
    
    static func view() -> LoginViewController {
        let interactor = LoginInteractor()
        let worker = LoginWoker()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let viewController = LoginViewController()
        
        router.currentViewController = viewController
        interactor.presenter = presenter
        interactor.worker = worker
        presenter.view = viewController
        viewController.interactor = interactor
        viewController.router = router
        
        return viewController
    }
    
}
