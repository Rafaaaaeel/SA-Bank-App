import UIKit

final class CardsInteractor: CardsInteractorOutput {
    var presenter: CardsPresenterOutput?
    var worker: CardsWorkerProtocol?
    
    
}

extension CardsInteractor: CardsInteractorInput {

    func getDebits() {
        worker?.getDebits()
    }
    
    func removeDebit(_ id: String) {
        worker?.removeDebit(id)
    }
    
}

extension CardsInteractor: CardsWokerOutputProtocol {
    
    func getDebitSucceded(response: CardsModel.Response) {
        let viewModel = CardsModel.ViewModel(data: response.data)
        presenter?.succededView(viewModel)
    }
    
    
    func getDebitFailed(error: Error) {
        presenter?.failedView()
    }
    
    func deleteDebitSucced(response: CardsModel.Response) {
        let viewModel = CardsModel.ViewModel(data: response.data)
        presenter?.deleteDebitSucceded(viewModel)
    }
    
}
