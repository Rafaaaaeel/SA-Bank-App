import UIKit


final class RegisterViewController: CommonViewController,
                                    RegisterViewControllerProtocol {
    
    weak var interactor: RegisterInteractorInput?
    weak var router: RegisterRouterProtocol?
    
    private lazy var registerView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
}


extension RegisterViewController: RegisterInteractorInput {
    
    func didRegister() {
        
    }
    
    
}
