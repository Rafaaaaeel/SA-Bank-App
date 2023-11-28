import UIKit

// Presenter -> ViewController
protocol CardsPresenterOutput: AnyObject {
    var view: CardsViewControllerProtocol? { get }
    
    func succededView(_ viewModel: CardsModel.ViewModel)
    func failedView()
    
    func deleteDebitSucceded(_ viewModel: CardsModel.ViewModel)
}

// ViewController -> Interactor
protocol CardsInteractorInput: AnyObject {
    func getDebits()
    func removeDebit(_ id: String)
}

// Interactor -> Presenter
protocol CardsInteractorOutput: AnyObject {
    var presenter: CardsPresenterOutput? { get }
    var worker: CardsWorkerProtocol? { get }
}

// ViewController -> Router
protocol CardsRouterProtocol: AnyObject {
    func didSelectCard(of id: String, at position: CGRect, model: Debit)
    func didTouchCreate()
}

// Interactor -> Worker
protocol CardsWorkerProtocol: CardsWokerInputProtocol, AnyObject {
    var apiClient: APIClientProtocol { get }
    var output: CardsWokerOutputProtocol? { get set }
}

protocol CardsWokerInputProtocol: AnyObject {
    func getDebits()
    func removeDebit(_ id: String)
}

protocol CardsWokerOutputProtocol: AnyObject {
    func getDebitSucceded(response: CardsModel.Response)
    func getDebitFailed(error: Error)
    
    func deleteDebitSucced(response: CardsModel.Response)
}

// ViewController
protocol CardsViewControllerProtocol: AnyObject {
    var interactor: CardsInteractorInput? { get }
    var router: CardsRouterProtocol? { get }
    
    func didLoadView()
    func didLoadData(_ viewModel: CardsModel.ViewModel)
    func didLoadFailed()
    func didDeleted(_ viewModel: CardsModel.ViewModel)
}
