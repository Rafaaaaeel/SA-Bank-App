import UIKit

// Presenter -> ViewController
protocol CreatorPresenterOutput: AnyObject {
    var view: CreatorViewControllerProtocol? { get }
    
}

// ViewController -> Interactor
protocol CreatorInteractorInput: AnyObject { }

// Interactor -> Presenter
protocol CreatorInteractorOutput: AnyObject {
    var presenter: CreatorPresenterOutput? { get }
    var worker: CreatorWorkerProtocol? { get }
}

// ViewController -> Router
protocol CreatorRouterProtocol: AnyObject { }

// Interactor -> Worker
protocol CreatorWorkerProtocol: CreatorWokerInputProtocol, AnyObject {
    var apiClient: APIClientProtocol { get }
    var output: CreatorWokerOutputProtocol? { get set }
}

protocol CreatorWokerInputProtocol: AnyObject { }

protocol CreatorWokerOutputProtocol: AnyObject { }

// ViewController
protocol CreatorViewControllerProtocol: AnyObject {
    var interactor: CreatorInteractorInput? { get }
    var router: CreatorRouterProtocol? { get }
}
