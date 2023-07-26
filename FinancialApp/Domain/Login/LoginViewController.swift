import UIKit

class LoginViewController: UIViewController {
    
    var interactor: LoginInteractorInput?
    var router: LoginRouterProtocol?
    
    private var loginView: LoginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didViewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        loginView.delegate = self
        view = loginView
    }
        
}

extension LoginViewController: LoginViewControllerProtocol {

    func didViewDidLoad() { }
    
    func didLoginSuccess() { }
    
    func didLoginFailed() { }
    
}

extension LoginViewController: LoginInteractorInput {
    
    func didLogin() { }
    
}

extension LoginViewController: LoginViewDelegate {
    
    func didTouchLogin() {
        router?.didLogin()
    }
    
    func didTouchRegister() {
        router?.didTouchToRegister()
    }
    
    func didTouchForgetPassword() { }
    
}
