import UIKit

// Presenter -> ViewController
protocol RegisterPresenterOutput: AnyObject {
    var view: RegisterViewControllerProtocol? { get }
}

// ViewController -> Interactor
protocol RegisterInteractorInput: AnyObject {
    func didRegister()
}

// Interactor -> Presenter
protocol RegisterInteractorOutput: AnyObject {
    var presenter: RegisterPresenterOutput? { get }
    var worker: RegisterWorkerProtocol? { get }
}

// ViewController -> Router
protocol RegisterRouterProtocol: AnyObject {
    
    var controller: UINavigationController? { get }
    
    func didRegister()
}

// Interactor -> Worker
protocol RegisterWorkerProtocol: AnyObject {
    var apiClient: APIClientProtocol { get }
}

// ViewController
protocol RegisterViewControllerProtocol: AnyObject {
    var interactor: RegisterInteractorInput? { get }
    var router: RegisterRouterProtocol? { get }
}
