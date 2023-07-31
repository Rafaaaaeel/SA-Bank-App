import UIKit

// Presenter -> ViewController
protocol DebitsPresenterOutput: AnyObject {
    var view: DebitsViewControllerProtocol? { get }
}

// ViewController -> Interactor
protocol DebitsInteractorInput: AnyObject {
    func didTouchDebit()
}

// Interactor -> Presenter
protocol DebitsInteractorOutput: AnyObject {
    var presenter: DebitsPresenterOutput? { get }
    var worker: DebitsWorkerProtocol? { get }
}

// ViewController -> Router
protocol DebitsRouterProtocol: AnyObject {
    func didTouchDebit()
}

// Interactor -> Worker
protocol DebitsWorkerProtocol: AnyObject {
    var apiClient: APIClientProtocol { get }
}

// ViewController
protocol DebitsViewControllerProtocol: AnyObject {
    var interactor: DebitsInteractorInput? { get }
    var router: DebitsRouterProtocol? { get }
}
