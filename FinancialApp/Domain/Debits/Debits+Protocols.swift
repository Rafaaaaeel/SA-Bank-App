import UIKit

// Presenter -> ViewController
protocol DebitsPresenterOutput: AnyObject {
    var view: DebitsViewControllerProtocol? { get }
    
    func succededView(_ viewModel: DebitsModel.ViewModel)
    func failedView()
}

// ViewController -> Interactor
protocol DebitsInteractorInput: AnyObject {
    func getDebits()
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
protocol DebitsWorkerProtocol: DebitWokerInputProtocol, AnyObject {
    var apiClient: APIClientProtocol { get }
    var output: DebitWokerOutputProtocol? { get set }
}

protocol DebitWokerInputProtocol: AnyObject {
    func getDebits()
}

protocol DebitWokerOutputProtocol: AnyObject {
    func getDebitSucceded(response: DebitsModel.Response)
    func getDebitFailed(error: Error)
}

// ViewController
protocol DebitsViewControllerProtocol: AnyObject {
    var interactor: DebitsInteractorInput? { get }
    var router: DebitsRouterProtocol? { get }
    
    func didLoadView()
    func didLoadData(_ viewModel: DebitsModel.ViewModel)
}
