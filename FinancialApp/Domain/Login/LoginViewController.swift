import UIKit

class LoginViewController: UINavigationController {
    
    var interactor: LoginInteractorInput?
    var router: LoginRouterProtocol?
    
    private var loginView: UIView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didViewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
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
