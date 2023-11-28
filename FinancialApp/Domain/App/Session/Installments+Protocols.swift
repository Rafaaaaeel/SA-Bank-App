import UIKit

// Presenter -> ViewController
protocol InstallmentsPresenterOutput: AnyObject {
    var view: InstallmentsViewControllerProtocol? { get }
}

// ViewController -> Interactor
protocol InstallmentsInteractorInput: AnyObject {
    
}

// Interactor -> Presenter
protocol InstallmentsInteractorOutput: AnyObject {
    var presenter: InstallmentsPresenterOutput? { get }
    var worker: InstallmentWorkerProtocol? { get }
}

// ViewController -> Router
protocol InstallmentsRouterProtocol: AnyObject {
  
}

// Interactor -> Worker
protocol InstallmentWorkerProtocol: InstallmentsWokerInputProtocol, AnyObject {
    var apiClient: APIClientProtocol { get }
    var output: InstallmentsWokerOutputProtocol? { get set }
}

protocol InstallmentsWokerInputProtocol: AnyObject {
    
}

protocol InstallmentsWokerOutputProtocol: AnyObject {
    
}

// ViewController
protocol InstallmentsViewControllerProtocol: AnyObject {
    var interactor: InstallmentsInteractorInput? { get }
    var router: InstallmentsRouterProtocol? { get }
}
