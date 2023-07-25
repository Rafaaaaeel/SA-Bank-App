import UIKit

class LoginRouter: LoginRouterProtocol {
    
    var controller: UINavigationController?
    
    func didForgetPassword() {
        print("Forget password")
    }
    
    
    func didTouchToRegister() {
        controller?.pushViewController(RegisterConfigurator.view(), animated: true)
    }
    
    func didLogin() {
        print("Router login")
    }
    
}
