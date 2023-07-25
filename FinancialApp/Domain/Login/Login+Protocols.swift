import UIKit

// Presenter -> ViewController
protocol LoginPresenterOutput {
    
    var view: LoginViewControllerProtocol? { get }
    
    func didLoginSuccess()
    func didLoginFailed()
}

// ViewContorller -> Interactor
protocol LoginInteractorInput {
    
    func didLogin()
    
}

// Interactor -> Presenter
protocol LoginInteractorOutput {
    
    var presenter: LoginPresenterOutput? { get }
    var worker: LoginWorkerProtocol? { get }
    
    func didLoginSuccess()
    func didLoginFailed()
    
}

protocol LoginViewControllerProtocol {
    
    var interactor: LoginInteractorInput? { get }
    var router: LoginRouterProtocol? { get }
    
    func didViewDidLoad()
    func didLoginSuccess()
    func didLoginFailed()
    
}

// ViewController -> Router
protocol LoginRouterProtocol {
    
    var controller: UINavigationController? { get }
    
    func didTouchToRegister()
    func didLogin()
    func didForgetPassword()
    
}

// Interactor -> Woker
protocol LoginWorkerProtocol {
    
    var apiClient: APIClientProtocol { get }
    
    func didLogin()
    
}
