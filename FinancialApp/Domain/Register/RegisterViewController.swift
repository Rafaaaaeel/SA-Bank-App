import UIKit


final class RegisterViewController: UINavigationController,
                                    RegisterViewControllerProtocol {
    
    weak var interactor: RegisterInteractorInput?
    weak var router: RegisterRouterProtocol?
    
    
}


extension RegisterViewController: RegisterInteractorInput {
    
    func didRegister() {
        
    }
    
    
}
