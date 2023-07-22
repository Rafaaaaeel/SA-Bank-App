class LoginPresenter: LoginPresenterOutput {
    
    
    var view: LoginViewControllerProtocol?
    
    func didLoginSuccess() {
        view?.didLoginSuccess()
    }
    
    func didLoginFailed() {
        view?.didLoginFailed()
    }
    
}
