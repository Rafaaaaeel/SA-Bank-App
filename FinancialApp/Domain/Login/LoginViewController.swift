import UIKit

class LoginViewController: UIViewController {
    
    var interactor: LoginInteractorInput?
    var router: LoginRouterProtocol?
    
    private var loginView: LoginView = LoginView()
    private var sessionManager: SessionManagerProtocol
    
    init(sessionManager: SessionManagerProtocol = SessionManager.shared) {
        self.sessionManager = sessionManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        sessionManager.isUserLogged = true
        router?.didLogin()
    }
    
    func didTouchRegister() {
        router?.didTouchToRegister()
    }
    
    func didTouchForgetPassword() { }
    
}
