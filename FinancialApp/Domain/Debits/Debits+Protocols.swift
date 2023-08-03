import UIKit

// Presenter -> ViewController
protocol DebitsPresenterOutput: AnyObject {
    var view: DebitsViewControllerProtocol? { get }
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
}

protocol DebitWokerInputProtocol: AnyObject {
    func getDebits()
}

protocol DebitWokerOutputProtocol: AnyObject {
    func getDebitSucceded(debit: DebitsModel.ViewModel)
    func getDebitFailed(error: Error)
}

// ViewController
protocol DebitsViewControllerProtocol: AnyObject {
    var interactor: DebitsInteractorInput? { get }
    var router: DebitsRouterProtocol? { get }
    
    
    func didLoad()
}
