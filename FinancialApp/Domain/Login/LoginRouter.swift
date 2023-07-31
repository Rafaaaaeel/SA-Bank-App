import UIKit

class LoginRouter: AppRouter, LoginRouterProtocol {
    
    func didForgetPassword() {
        print("Forget password")
    }
    
    
    func didTouchToRegister() {
        moveTo(RegisterConfigurator.view())
    }
    
    func didLogin() {
        rootViewController(AppConfigurator.view())
    }
    
}
