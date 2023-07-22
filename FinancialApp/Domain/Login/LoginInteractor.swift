class LoginInteractor: LoginInteractorInput {
    
    var presenter: LoginPresenterOutput?
    var worker: LoginWorkerProtocol?
    
    func didLogin() {
        worker?.didLogin()
    }
    
}

extension LoginInteractor: LoginInteractorOutput {

    func didLoginSuccess() {
        presenter?.didLoginSuccess()
    }
    
    func didLoginFailed() {
        presenter?.didLoginFailed()
    }
    
}
