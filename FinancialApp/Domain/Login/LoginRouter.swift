import UIKit

class LoginRouter: LoginRouterProtocol {
    
    var controller: UIViewController?
    
    func didForgetPassword() {
        print("Forget password")
    }
    
    
    func didTouchToRegister() {
        controller?.navigationController?.pushViewController(RegisterConfigurator.view(), animated: true)
    }
    
    func didLogin() {
        let viewController = DebitsConfigurator.view()
        viewController.modalPresentationStyle = .fullScreen
        controller?.present(viewController, animated: false)
    }
    
}
